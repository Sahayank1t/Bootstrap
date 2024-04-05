<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Create Outlook .msg File</title>
</head>
<body>
<h1>Create Outlook .msg File</h1>
<button id="generateButton">Generate .msg File</button>

<script>
document.getElementById('generateButton').addEventListener('click', function() {
    // Define your HTML content
    const htmlContent = `
    <html>
    <head>
        <title>Test Email</title>
    </head>
    <body>
        <h1>Hello, Outlook!</h1>
        <p>This is a test email.</p>
    </body>
    </html>`;

    // Generate .msg file content
    const msgContent = `Subject: Test Email\r\n`
                    + `Content-Type: text/html; charset=utf-8\r\n`
                    + `Content-Transfer-Encoding: base64\r\n\r\n`
                    + `${btoa(htmlContent)}`;

    // Create a Blob from the content
    const blob = new Blob([msgContent], { type: 'application/vnd.ms-outlook-message' });

    // Create a link element and trigger download
    const link = document.createElement('a');
    link.href = URL.createObjectURL(blob);
    link.download = 'test_email.msg';
    link.click();
});
</script>
</body>
</html>
