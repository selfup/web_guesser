import axios from 'axios';

const app = document.querySelector('#app');

const render = (data) => {
  app.innerHTML = `
    <div>
      <h2>First Key: ${data.key1}</h2>
      <h2>Second Key: ${data.key2}</h2>
    </div>
  `;
};

axios.get('/api/v1/some_data.json')
  .then((res) => {
    render(res.data);
  })
  .catch((err) => {
    throw new Error(err);
  });
