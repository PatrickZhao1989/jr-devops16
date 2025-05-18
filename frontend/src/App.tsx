import { useEffect, useState } from 'react';

function App() {
  const [message, setMessage] = useState('Loading...');

  useEffect(() => {
    fetch('/api/HelloWorld/helloworld')
      .then((res) => res.text())
      .then((data) => setMessage(data))
      .catch((err) => {
        console.error('Error fetching hello world:', err);
        setMessage('Failed to load message');
      });
  }, []);

  return (
    <div style={{ padding: 40 }}>
      <h1>🚀 React + Vite Frontend</h1>
      <p>Backend says: <strong>{message}</strong></p>
    </div>
  );
}

export default App;
