import * as functions from "firebase-functions";
import * as admin from "firebase-admin";
admin.initializeApp();
const firestore = admin.firestore();

const DEFAULT_REGION = "asia-northeast1";

exports.createUser = functions
  .region(DEFAULT_REGION)
  .firestore.document("users/{userId}")
  .onCreate(async (snap) => {
    const newValue = snap.data();
    await firestore.collection("users").doc(newValue.id).set(
      {
        followCount: 0,
        followerCount: 0,
        myPostCount: 0,
      },
      { merge: true }
    );
  });
