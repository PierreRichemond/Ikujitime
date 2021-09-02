
const activeBtn = () => {
  const buttons = document.querySelectorAll(".tag-btn");
  const allButton = document.querySelector(".all-tag-btn");
  const childTag = document.querySelector(".child-tag");
  buttons.forEach((button) => {
    button.classList.remove('active-btn');
    if(button.href === window.location.href) {
      button.classList.add('active-btn')
    }
  });
  const activeBtn = document.querySelectorAll(".active-btn")
  if (!activeBtn.length) {
    allButton.classList.add('active-btn')
  }
};

export { activeBtn };
