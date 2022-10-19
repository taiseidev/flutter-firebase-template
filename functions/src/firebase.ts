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
// type RequestHandler = {
//   trigger: (req: Request, resp: Response) => Promise<unknown>;
// };

const getHandler = async (handlerFileName: string, method: string) => {
  const handlerFilePath = `./triggers/${method}/${handlerFileName}`;
  return await import(handlerFilePath);
};

const db = functions.region("asia-northeast1").firestore;
// const https = functions.region("asia-northeast1").https;

/**
 * @param documentPath - トリガー起点の Firestore ドキュメントのパス
 * @param handlerFileName - "./triggers"直下のファイル名（拡張子除く）
 */
export const onCreate = (
  documentPath: string,
  handlerFileName: string,
  method: string
) => {
  return db.document(documentPath).onCreate(async (snapshot, context) => {
    const handler: SnapshotHandler = await getHandler(handlerFileName, method);
    return handler.trigger(snapshot, context);
  });
};

/**
 * @param documentPath - トリガー起点の Firestore ドキュメントのパス
 * @param handlerFileName - "./triggers"直下のファイル名（拡張子除く）
 */
export const onDelete = (
  documentPath: string,
  handlerFileName: string,
  method: string
) => {
  return db.document(documentPath).onDelete(async (snapshot, context) => {
    const handler: SnapshotHandler = await getHandler(handlerFileName, method);
    return handler.trigger(snapshot, context);
  });
};

/**
 * @param documentPath - トリガー起点の Firestore ドキュメントのパス
 * @param handlerFileName - "./triggers"直下のファイル名（拡張子除く）
 */
export const onUpdate = (
  documentPath: string,
  handlerFileName: string,
  method: string
) => {
  return db.document(documentPath).onUpdate(async (change, context) => {
    const handler: ChangeHandler = await getHandler(handlerFileName, method);
    return handler.trigger(change, context);
  });
};

/**
 * @param handlerFileName - "./triggers"直下のファイル名（拡張子除く）
 */
// export const onHttps = (handlerFileName: string) => {
//   return https.onRequest(async (req, resp) => {
//     const handler: RequestHandler = await getHandler(handlerFileName);
//     return handler.trigger(req, resp);
//   });
// };

// 参考
// https://knmts.com/as-a-engineer-17/
