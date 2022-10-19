import * as functions from "firebase-functions";
import * as admin from "firebase-admin";
admin.initializeApp();
const firestore = admin.firestore();

const DEFAULT_REGION = "asia-northeast1";
const DEFAULT_COUNT = 0;
const INCREMENT_COUNT = 1;
const USERS_COLL = "users";

exports.createUser = functions
  .region(DEFAULT_REGION)
  .firestore.document(`${USERS_COLL}/{userId}`)
  .onCreate(async (snap): Promise<void> => {
    const newValue = snap.data();
    await firestore.collection(`${USERS_COLL}`).doc(newValue.id).set(
      {
        followCount: DEFAULT_COUNT,
        followerCount: DEFAULT_COUNT,
        myPostCount: DEFAULT_COUNT,
      },
      { merge: true }
    );
  });

exports.incrementPostCount = functions
  .region(DEFAULT_REGION)
  .firestore.document(`${USERS_COLL}/{userId}/myPosts/{postId}`)
  .onCreate(async (snap): Promise<void> => {
    const newValue = snap.data();
    await firestore
      .collection(`${USERS_COLL}`)
      .doc(newValue.id)
      .set(
        {
          myPostCount: admin.firestore.FieldValue.increment(INCREMENT_COUNT),
        },
        { merge: true }
      );
  });

exports.incrementFollowCount = functions
  .region(DEFAULT_REGION)
  .firestore.document(`${USERS_COLL}/{userId}/follows/{followId}`)
  .onCreate(async (_, context): Promise<void> => {
    const userId = context.auth?.uid;
    await firestore
      .collection(`${USERS_COLL}`)
      .doc(userId!)
      .set(
        {
          followCount: admin.firestore.FieldValue.increment(INCREMENT_COUNT),
        },
        { merge: true }
      );
  });

exports.incrementFollowersCount = functions
  .region(DEFAULT_REGION)
  .firestore.document(`${USERS_COLL}/{userId}/followers/{followerId}`)
  .onCreate(async (_, context): Promise<void> => {
    const userId = context.auth?.uid;
    await firestore
      .collection(`${USERS_COLL}`)
      .doc(userId!)
      .set(
        {
          followCount: admin.firestore.FieldValue.increment(INCREMENT_COUNT),
        },
        { merge: true }
      );
  });

exports.incrementLikeCount = functions
  .region(DEFAULT_REGION)
  .firestore.document(`posts/{postId}/likeUsers/{likeUsersId}`)
  .onCreate(async (_, context): Promise<void> => {
    // postIdを取得してlikeCountsをインクリメントする必要がある。。
    // await firestore
    //   .collection(`posts`)
    //   .doc(postId!)
    //   .set(
    //     {
    //       likeCount: admin.firestore.FieldValue.increment(INCREMENT_COUNT),
    //     },
    //     { merge: true }
    //   );
  });
