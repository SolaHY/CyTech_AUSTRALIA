const express = require('express');
const cors = require('cors');
const axios = require('axios');
const app = express();

// Slack webhook URL
const SLACK_WEBHOOK_URL = 'https://hooks.slack.com/services/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';

// Configure CORS - allow all localhost ports during development
app.use(cors({
  origin: /^http:\/\/localhost:\d+$/, // Allow any localhost port
  methods: ['GET', 'POST'],
  allowedHeaders: ['Content-Type']
}));

app.use(express.json());

// ルートパスのハンドラーを追加
app.get('/', (req, res) => {
  res.json({
    status: 'ok',
    message: 'Slack notification proxy server is running',
    webhookUrl: 'configured'
  });
});

app.post('/api/slack', async (req, res) => {
  try {
    console.log('Received request:', req.body);
    const response = await axios.post(
      SLACK_WEBHOOK_URL,
      req.body,
      {
        headers: {
          'Content-Type': 'application/json'
        }
      }
    );
    console.log('Slack response:', response.data);
    res.json(response.data);
  } catch (error) {
    console.error('Error:', error.response?.data || error.message);
    res.status(500).json({ error: error.message });
  }
});

const PORT = process.env.PORT || 3000;
app.listen(PORT, () => {
  console.log(`Server running on port ${PORT}`);
  console.log(`Test the server by visiting http://localhost:${PORT}`);
}); 