/**
 * Import function triggers from their respective submodules:
 *
 * const {onCall} = require("firebase-functions/v2/https");
 * const {onDocumentWritten} = require("firebase-functions/v2/firestore");
 *
 * See a full list of supported triggers at https://firebase.google.com/docs/functions
 */

const functions = require("firebase-functions");
const logger = require("firebase-functions/logger");
const stripe = require("stripe")("sk_live_HRapUtuotvF0CmrjLFW8AQRh");
const admin = require("firebase-admin");
const endPointSecret = "whsec_pD95FWIgPmHpQcQAbfWjoWhlS9DONX6E";
admin.initializeApp(functions.config().functions);

const {
    log,
    info,
    debug,
    warn,
    error,
    write,
  } = require("firebase-functions/logger");



exports.events = functions.https.onRequest(async (request, response) => {
    log("Hello logs!");

    let body = request.body;
    log(body);
    let data = body.data.object;
    let plan = data.plan;

    log(plan);

    if (body.type == "customer.subscription.created") {

        const customer = await stripe.customers.retrieve(
          data.customer
        );

        log(customer);

        return admin.firestore().collection("subscribed_users").doc().set({
                customer_id: data.customer,
                email: customer.email,
                discount: customer.discount,
                livemode: customer.livemode,
                country: customer.address.country,
                api_id: plan.id,
                amount: plan.amount,
                active: plan.active,
                product: plan.product,
                status: data.status,
                currency: plan.currency,
                event_type: body.type,
                //data: request.body
            }).then(writeResult => {
                log("Write done")
            })
            .catch((e) => {
                log("error occured")
                log(e)
            });
    } else {

        try {
        admin.firestore().collection("subscribed_users").where("customer_id", "==", data.customer).get()
        .then((documents) => {
            documents.forEach((document) => {
                document.ref.delete();
             })
        })
        } catch (err) {
         log("error occured")
         log(err)
        }

    }
    //response.send("Endpoint for Stripe Webhooks!");
  });



   

// Create and deploy your first functions
// https://firebase.google.com/docs/functions/get-started

// exports.helloWorld = onRequest((request, response) => {
//   logger.info("Hello logs!", {structuredData: true});
//   response.send("Hello from Firebase!");
// });
