import type { Snapshot, Context } from "../../firebase";
import * as admin from "firebase-admin";
const firestore = admin.firestore();

export const trigger = async (snapshot: Snapshot, context: Context) => {
  const newValue = snapshot.data();
  await firestore
    .collection(Constants.USERS)
    .doc(newValue.id)
    .set(
      {
        myPostCount: admin.firestore.FieldValue.increment(
          Constants.INCREMENT_COUNT
        ),
      },
      { merge: true }
    );
};
