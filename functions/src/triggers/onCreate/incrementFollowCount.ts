import type { Snapshot, Context } from "../../firebase";
import * as admin from "firebase-admin";
const firestore = admin.firestore();

export const trigger = async (snapshot: Snapshot, context: Context) => {
  const userId = context.auth?.uid;
  await firestore
    .collection("users")
    .doc(userId!)
    .set(
      {
        followCount: admin.firestore.FieldValue.increment(1),
      },
      { merge: true }
    );
};
