const http = require('http');

const PORT = 3001;
const HOST = '0.0.0.0';

// HTML content with modern styling
const htmlContent = `
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Lautaro Ogando DevOps</title>
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;700&display=swap" rel="stylesheet">
    <style>
        body {
            font-family: 'Inter', sans-serif;
            display: flex;
            justify-content: center;
            align-items: center;
            min-height: 100vh;
            margin: 0;
            background-color: #f0f2f5; /* Light gray background */
            color: #333; /* Darker text for contrast */
            text-align: center;
            overflow: hidden; /* Prevent scrollbars */
        }
        .container {
            background-color: #ffffff; /* White container background */
            padding: 40px 60px;
            border-radius: 15px; /* Rounded corners */
            box-shadow: 0 10px 30px rgba(0, 0, 0, 0.1); /* Soft shadow */
            max-width: 90%;
            box-sizing: border-box;
            animation: fadeIn 1s ease-out; /* Simple fade-in animation */
        }
        h1 {
            font-size: 3em; /* Larger font size */
            color: #4CAF50; /* A vibrant green color */
            margin-bottom: 15px;
            letter-spacing: 1px; /* Slightly spaced letters */
            text-shadow: 1px 1px 2px rgba(0,0,0,0.05); /* Subtle text shadow */
        }
        p {
            font-size: 1.2em;
            color: #555;
            line-height: 1.6;
        }

        /* Keyframe animation */
        @keyframes fadeIn {
            from { opacity: 0; transform: translateY(20px); }
            to { opacity: 1; transform: translateY(0); }
        }

        /* Responsive adjustments */
        @media (max-width: 768px) {
            .container {
                padding: 30px 40px;
            }
            h1 {
                font-size: 2.2em;
            }
            p {
                font-size: 1em;
            }
        }
        @media (max-width: 480px) {
            .container {
                padding: 20px 25px;
                border-radius: 10px;
            }
            h1 {
                font-size: 1.8em;
            }
        }
    </style>
</head>
<body>
    <div class="container">
        <h1>Lautaro Ogando DevOps</h1>
        <p>Your application is running successfully via GitHub Actions & Ansible!</p>
    </div>
</body>
</html>
`;

const server = http.createServer((req, res) => {
  // Set Content-Type to text/html for serving HTML
  res.writeHead(200, { 'Content-Type': 'text/html' });
  res.end(htmlContent);
});

server.listen(PORT, HOST, () => {
  console.log(`Server running at http://${HOST}:${PORT}/`);
});

// Optional: Basic server error handling
server.on('error', (err) => {
  if (err.code === 'EADDRINUSE') {
    console.error(`Port ${PORT} is already in use.`);
  } else {
    console.error('Server error:', err.message);
  }
  process.exit(1); // Exit with an error code
});
