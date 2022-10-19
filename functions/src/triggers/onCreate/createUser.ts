import type { Snapshot, Context } from "../../firebase";
import * as admin from "firebase-admin";
const firestore = admin.firestore();

export const trigger = async (snapshot: Snapshot, context: Context) => {
  const newValue = snapshot.data();
  await firestore.collection("users").doc(newValue.id).set(
    {
      followCount: 0,
      followerCount: 0,
      myPostCount: 0,
    },
    { merge: true }
  );
};
