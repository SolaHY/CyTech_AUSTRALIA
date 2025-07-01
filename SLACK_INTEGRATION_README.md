# Slack Integration Setup Guide

This guide explains how to set up Slack notifications for the CyTech Australia contact form.

## Overview

The contact form sends notifications to Slack whenever someone submits a message. This integration works across all platforms (Web, Mobile, Desktop).

## Setup Options

### Option 1: Local Proxy Server (Recommended for Development)

1. **Install Node.js dependencies:**

   ```bash
   cd server
   npm install
   ```

2. **Start the proxy server:**

   ```bash
   npm start
   ```

   The server will run on `http://localhost:3000`

3. **Test the server:**

   ```bash
   curl http://localhost:3000/health
   ```

4. **Run your Flutter app:**
   ```bash
   flutter run -d chrome
   ```

### Option 2: Direct Slack Webhook (Mobile Only)

For mobile apps, you can use the Slack webhook directly without any proxy:

1. **Update the webhook URL** in `lib/config/proxy_config.dart`:

   ```dart
   static const String proxyUrl = 'YOUR_SLACK_WEBHOOK_URL';
   ```

2. **Run on mobile device:**
   ```bash
   flutter run -d android
   # or
   flutter run -d ios
   ```

### Option 3: CORS Proxy (Web Development)

For web development without a local server, the app will try public CORS proxies:

- `https://api.allorigins.win/`
- `https://cors-anywhere.herokuapp.com/`

**Note:** These public proxies may have rate limits or be unreliable.

## Production Deployment

For production, consider these options:

### Option A: Backend Server

Deploy the Node.js proxy server to a cloud platform:

- Heroku
- Vercel
- Netlify Functions
- AWS Lambda

### Option B: Serverless Function

Create a serverless function (AWS Lambda, Vercel Functions, etc.) to handle the webhook.

### Option C: Backend API

Integrate with your existing backend API to handle Slack notifications.

## Configuration

### Slack Webhook Setup

1. Go to your Slack workspace
2. Create a new app or use an existing one
3. Enable "Incoming Webhooks"
4. Create a new webhook for your channel
5. Copy the webhook URL
6. Update `lib/config/proxy_config.dart`:

```dart
static const String proxyUrl = 'https://hooks.slack.com/services/YOUR/WEBHOOK/URL';
```

### Environment Variables (Optional)

For better security, use environment variables:

```dart
static const String proxyUrl = String.fromEnvironment('SLACK_WEBHOOK_URL');
```

Then run with:

```bash
flutter run --dart-define=SLACK_WEBHOOK_URL=https://hooks.slack.com/services/YOUR/WEBHOOK/URL
```

## Testing

1. **Fill out the contact form** with test data
2. **Submit the form**
3. **Check your Slack channel** for the notification
4. **Verify the message format** includes:
   - Name
   - Email
   - Message content
   - Source indicator

## Troubleshooting

### CORS Errors (Web)

- **Symptom:** "Failed to fetch" errors in browser console
- **Solution:** Use the local proxy server or deploy a backend

### Network Errors

- **Symptom:** Connection timeout or network errors
- **Solution:** Check your internet connection and Slack webhook URL

### Invalid Webhook URL

- **Symptom:** 404 or 403 errors from Slack
- **Solution:** Verify your webhook URL is correct and active

### Rate Limiting

- **Symptom:** 429 errors from Slack
- **Solution:** Slack has rate limits. Consider implementing retry logic.

## Message Format

The Slack message includes:

- Header with bell emoji
- Name and email fields
- Message content
- Source indicator (CyTech Australia website)

## Security Considerations

1. **Never commit webhook URLs** to public repositories
2. **Use environment variables** for production
3. **Implement rate limiting** to prevent abuse
4. **Validate input** on both client and server
5. **Use HTTPS** for all webhook communications

## Support

If you encounter issues:

1. Check the browser console for errors
2. Verify the proxy server is running (if using local proxy)
3. Test the Slack webhook URL directly
4. Check Slack app permissions and webhook settings
