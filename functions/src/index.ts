import * as functions from "firebase-functions";
import * as admin from "firebase-admin";
admin.initializeApp();

export const createUser = functions
  .region("asia-northeast1")
  .firestore.document("users/{userId}")
  .onCreate((snap) => {
    const value = snap.data();
    admin.auth().setCustomUserClaims(value.id, {
      role: value.type == 0 ? "管理者" : "スタッフ",
    });
  });
