import React, { useEffect, useState } from 'react';

function App() {
  const [message, setMessage] = useState('Loading...');

  const backendBaseUrl = import.meta.env.VITE_BACKEND_URL
  const helloworldEndpoint = `${backendBaseUrl}/helloworld/helloworld`;

  useEffect(() => {
    fetch(helloworldEndpoint)
      .then((res) => res.text())
      .then((data) => setMessage(data))
      .catch((err) => {
        console.error('Error fetching:', err);
        setMessage('Failed to load message');
      });
  }, []);

  return (
    <div style={{ padding: 40 }}>
      <h1>🌐 Frontend Talking to Backend</h1>
      <p><strong>{message}</strong></p>
    </div>
  );
}

export default App;
