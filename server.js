const express = require('express');
const cors = require('cors');
const axios = require('axios');
const app = express();

// Your Slack webhook URL - Replace this with your new webhook URL
const SLACK_WEBHOOK_URL = 'YOUR_NEW_WEBHOOK_URL';

app.use(cors());
app.use(express.json());

app.post('/api/contact', async (req, res) => {
  try {
    const { name, email, message } = req.body;
    console.log('Received contact form submission:', { name, email, message });

    // Format the message for Slack
    const slackPayload = {
      blocks: [
        {
          type: 'header',
          text: {
            type: 'plain_text',
            text: '🔔 New Contact Form Submission',
            emoji: true
          }
        },
        {
          type: 'section',
          fields: [
            {
              type: 'mrkdwn',
              text: `*Name:*\n${name}`
            },
            {
              type: 'mrkdwn',
              text: `*Email:*\n${email}`
            }
          ]
        },
        {
          type: 'section',
          text: {
            type: 'mrkdwn',
            text: `*Message:*\n${message}`
          }
        },
        {
          type: 'context',
          elements: [
            {
              type: 'mrkdwn',
              text: '📝 Submitted from CyTech Australia Website'
            }
          ]
        }
      ]
    };

    console.log('Sending to Slack:', JSON.stringify(slackPayload, null, 2));

    // Send to Slack
    const slackResponse = await axios.post(SLACK_WEBHOOK_URL, slackPayload);
    console.log('Slack response:', {
      status: slackResponse.status,
      data: slackResponse.data
    });
    
    res.json({ success: true });
  } catch (error) {
    console.error('Detailed error:', {
      message: error.message,
      response: error.response?.data,
      status: error.response?.status
    });
    res.status(500).json({ 
      success: false, 
      error: error.message,
      details: error.response?.data
    });
  }
});

const PORT = process.env.PORT || 3000;
app.listen(PORT, () => {
  console.log(`Server running on port ${PORT}`);
  console.log(`Test the server by sending a POST request to http://localhost:${PORT}/api/contact`);
}); 