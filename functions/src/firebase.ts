import * as functions from "firebase-functions";

export type Snapshot = functions.firestore.QueryDocumentSnapshot;
export type Change =
  functions.Change<functions.firestore.QueryDocumentSnapshot>;
export type Context = functions.EventContext;
export type Request = functions.https.Request;
export type Response = functions.Response;

type SnapshotHandler = {
  trigger: (snapshot: Snapshot, context: Context) => Promise<unknown>;
};
type ChangeHandler = {
  trigger: (change: Change, context: Context) => Promise<unknown>;
};

// 引数からpathを作成。pathのファイルを読み込み
const getHandler = async (handlerFileName: string, method: string) => {
  const handlerFilePath = `./triggers/${method}/${handlerFileName}`;
  return await import(handlerFilePath);
};

const db = functions.region("asia-northeast1").firestore;

/**
 * @param documentPath - トリガー起点の Firestore ドキュメントのパス
 * @param handlerFileName - "./triggers"直下のファイル名（拡張子除く）
 */
export const onCreate = (documentPath: string, handlerFileName: string) => {
  return db.document(documentPath).onCreate(async (snapshot, context) => {
    const method = "onCreate";
    const handler: SnapshotHandler = await getHandler(handlerFileName, method);
    return handler.trigger(snapshot, context);
  });
};

/**
 * @param documentPath - トリガー起点の Firestore ドキュメントのパス
 * @param handlerFileName - "./triggers"直下のファイル名（拡張子除く）
 */
export const onDelete = (documentPath: string, handlerFileName: string) => {
  return db.document(documentPath).onDelete(async (snapshot, context) => {
    const method = "onUpdate";
    const handler: SnapshotHandler = await getHandler(handlerFileName, method);
    return handler.trigger(snapshot, context);
  });
};

/**
 * @param documentPath - トリガー起点の Firestore ドキュメントのパス
 * @param handlerFileName - "./triggers"直下のファイル名（拡張子除く）
 */
export const onUpdate = (documentPath: string, handlerFileName: string) => {
  return db.document(documentPath).onUpdate(async (change, context) => {
    const method = "onDelete";
    const handler: ChangeHandler = await getHandler(handlerFileName, method);
    return handler.trigger(change, context);
  });
};

// 参考
// https://knmts.com/as-a-engineer-17/
