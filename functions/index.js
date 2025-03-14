/**
 * Import function triggers from their respective submodules:
 *
 * const {onCall} = require("firebase-functions/v2/https");
 * const {onDocumentWritten} = require("firebase-functions/v2/firestore");
 *
 * See a full list of supported triggers at https://firebase.google.com/docs/functions
 */

const {onRequest} = require("firebase-functions/v2/https");
const logger = require("firebase-functions/logger");
const axios = require("axios");
const cors = require("cors")({origin: true});

// Create and deploy your first functions
// https://firebase.google.com/docs/functions/get-started

// exports.helloWorld = onRequest((request, response) => {
//   logger.info("Hello logs!", {structuredData: true});
//   response.send("Hello from Firebase!");
// });

// Slack Webhook URL (replace with your actual Webhook URL)
const SLACK_WEBHOOK_URL = "https://hooks.slack.com/services/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";

exports.sendContactForm = onRequest({
  region: "asia-southeast1",
  cors: true,
}, async (req, res) => {
  // Handle CORS preflight requests
  return cors(req, res, async () => {
    if (req.method !== "POST") {
      return res.status(405).json({error: "Method not allowed"});
    }

    try {
      const {name, email, message} = req.body;

      // Validate required fields
      if (!name || !email || !message) {
        return res.status(400).json({
          error: "Missing required fields",
          details: "Name, email, and message are required",
        });
      }

      // Format message for Slack
      const slackPayload = {
        blocks: [
          {
            type: "header",
            text: {
              type: "plain_text",
              text: "New Contact Form Submission",
              emoji: true,
            },
          },
          {
            type: "section",
            fields: [
              {
                type: "mrkdwn",
                text: `*Name:*\n${name}`,
              },
              {
                type: "mrkdwn",
                text: `*Email:*\n${email}`,
              },
            ],
          },
          {
            type: "section",
            text: {
              type: "mrkdwn",
              text: `*Message:*\n${message}`,
            },
          },
          {
            type: "context",
            elements: [
              {
                type: "mrkdwn",
                text: `Submitted at: ${new Date().toISOString()}`,
              },
            ],
          },
        ],
      };

      // Send to Slack
      await axios.post(SLACK_WEBHOOK_URL, slackPayload);

      logger.info("Contact form submitted successfully", {
        name,
        email,
      });

      return res.status(200).json({
        success: true,
        message: "Contact form submitted successfully",
      });
    } catch (error) {
      logger.error("Error processing contact form:", error);
      return res.status(500).json({
        error: "Failed to process contact form",
        details: error.message,
      });
    }
  });
});
