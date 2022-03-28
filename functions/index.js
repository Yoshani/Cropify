const functions = require("firebase-functions");
const admin = require("firebase-admin");

admin.initializeApp();

const messaging = admin.messaging();

exports.sendNotification = functions.firestore
  .document("incidents/{incidentId}")
  .onUpdate(async (change, _) => {
    console.log("Starting Send Notification Function");
    const newValue = change.after.data();
    const token = newValue.user.fcmToken;
    const name = newValue.user.name;

    if (newValue.status === "COMPLETED" && token) {
      try {
        console.log("Trying to send notification for", name);
        await messaging.sendToDevice(token, {
          notification: {
            title: "Cropify",
            body: `Dear ${name}, your incident reported for ${newValue.acres} acres has been successfully attended. You will receive the allocated amount of Rs.${newValue.amount} reimbursement shortly.`
          }
        });
        console.log("Notification sent successfully to", name);
        return true;
      } catch (ex) {
        console.error("Notification sending fail", name, token, ex);
        return false;
      }
    }
  });
