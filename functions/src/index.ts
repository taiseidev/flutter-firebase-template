import { onCreate } from "./firebase";
import * as admin from "firebase-admin";
admin.initializeApp();

export const createUser = onCreate("/users/{id}", "createUser");
export const incrementPostCount = onCreate(
  "/myPosts/{id}",
  "incrementPostCount"
);
export const incrementFollowCount = onCreate(
  "/follows/{id}",
  "incrementFollowCount"
);
export const incrementFollowersCount = onCreate(
  "/follows/{id}",
  "incrementFollowersCount"
);
