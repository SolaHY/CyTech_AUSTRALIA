const express = require('express');
const cors = require('cors');
const axios = require('axios');
const app = express();

app.use(cors());
app.use(express.json());

// ルートパスのハンドラーを追加
app.get('/', (req, res) => {
  res.json({
    status: 'ok',
    message: 'Slack notification proxy server is running',
    webhookUrl: process.env.SLACK_WEBHOOK_URL ? 'configured' : 'not configured'
  });
});

app.post('/api/slack', async (req, res) => {
  try {
    const response = await axios.post(
      process.env.SLACK_WEBHOOK_URL,
      req.body,
      {
        headers: {
          'Content-Type': 'application/json'
        }
      }
    );
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