import axios from 'axios';

const app = document.querySelector('#app');

const numbers = app.dataset.numbers;
const updateNumberOne = app.dataset.updateNumberOne;

const render = (data) => {
  app.innerHTML = `
    <div>
      <h2>First Key: ${data.first_number}</h2>
      <button class="up-one">Up One</button>
      <button class="down-one">Down One</button>
    </div>
  `;
};

const listenToButtons = () => {
  document.querySelector('.up-one')
    .addEventListener('click', () => {
      updateNumberOneClick('up');
    });
  document.querySelector('.down-one')
    .addEventListener('click', () => {
      updateNumberOneClick('down');
    });
};

const updateNumberOneClick = (direction) => {
  axios({
    method: 'post',
    url: updateNumberOne,
    params: { direction },
  })
    .then((res) => {
      render(res.data);
      listenToButtons();
    })
    .catch((err) => {
      throw new Error(err);
    });
};

axios.get(numbers)
  .then((res) => {
    render(res.data);
    listenToButtons();
  })
  .catch((err) => {
    throw new Error(err);
  });
