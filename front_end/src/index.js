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

const endpoint = app.dataset.someDataEndpoint;

axios.get(endpoint)
  .then((res) => {
    render(res.data);
  })
  .catch((err) => {
    throw new Error(err);
  });
