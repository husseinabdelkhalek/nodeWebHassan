const express = require('express');
const http = require('http');
const socketIo = require('socket.io');
const bodyParser = require('body-parser');

const app = express();
const server = http.createServer(app);
const io = socketIo(server);


// middleware
app.use(bodyParser.json());



app.get('/', (req, res) => {
  res.sendFile(__dirname + '/index.html');
});

app.get('/hi', (req, res) => {
  res.send('Hello World');
});


// socket.io connection
io.on('connection', (socket) => {
  // when connection starts
  console.log('a user connected');
  console.log(socket.id);
   
  // when connection ends
  socket.on('disconnect', () => {
    console.log('user disconnected');
  });

  // when a message is sent
  socket.on('chat message', (msg) => {
    io.emit('chat message', msg);
  });
});

const PORT = process.env.PORT || 3000;
server.listen(PORT, () => {
  console.log(`Server is running on port ${PORT}`);
});
