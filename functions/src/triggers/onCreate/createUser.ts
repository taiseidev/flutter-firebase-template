import type { Snapshot, Context } from "../../firebase";
import * as admin from "firebase-admin";
const firestore = admin.firestore();

export const trigger = async (snapshot: Snapshot, context: Context) => {
  const newValue = snapshot.data();
  const count = 0;
  await firestore.collection("users").doc(newValue.id).set(
    {
      followCount: count,
      followerCount: count,
      myPostCount: count,
    },
    { merge: true }
  );
};
