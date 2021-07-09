import axios from 'axios'

const form = document.querySelector('#inquiry-form');
const inquiryButton = form.querySelector('.button')
const inquiryError = form.querySelector('#inquiry-error')
const errorList = inquiryError.querySelector('ul')
const inquiryApi = 'https://49l881wnce.execute-api.ap-northeast-1.amazonaws.com/inquiry'

form.addEventListener('submit', function (event) {
  event.preventDefault();
  inquiryButton.setAttribute('disabled', true)

  let values = {
    name: event.target.querySelector('[name=name]').value.trim(),
    email: event.target.querySelector('[name=email]').value.trim(),
    message: event.target.querySelector('[name=message]').value.trim(),
    privacy_policy: event.target.querySelector('[name=privacy_policy]').checked,
    ua: navigator.userAgent
  }

  errorList.innerHTML = ''
  let errors = []
  if (values.name === "") {
    errors.push("お名前が未入力です。")
  }
  if (values.email === '') {
    errors.push("メールアドレスが未入力です。")
  }
  if (values.message === '') {
    errors.push("お問い合わせ内容が未入力です。")
  }
  if (!values.privacy_policy) {
    errors.push("プライバシーポリシーへの同意が必要です。")
  }

  if (errors.length > 0) {
    let df = document.createDocumentFragment();
    for (let i = 0; i < errors.length; i += 1) {
      let li = document.createElement('li')
      li.textContent = errors[i]
      df.appendChild(li)
    }

    errorList.appendChild(df)
    inquiryError.classList.remove('is-hidden')
    inquiryButton.removeAttribute('disabled')
    return
  } else if (!inquiryError.classList.contains('is-hidden')) {
    inquiryError.classList.add('is-hidden')
  }

  axios
    .post(inquiryApi, values)
    .then(function (response) {
      window.location.href = '/inquiry/thanks/'
    })
    .catch(function (error) {
      let li = document.createElement('li')
      li.textContent = error.response.data
      inquiryError.appendChild(li)
      inquiryError.classList.remove('is-hidden')
      inquiryButton.removeAttribute('disabled')
    })
});
