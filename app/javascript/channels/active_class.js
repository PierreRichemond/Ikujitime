
const activeBtn = () => {
  const buttons = document.querySelectorAll(".tag-btn");
  const allButton = document.querySelector(".all-tag-btn");
  const childTag = document.querySelector(".child-tag");
  buttons.forEach((button) => {
    if(childTag.innerHTML === button.innerHTML) {
      button.classList.add('active-btn');
      // window.location.href = button.href;
    }
    else if(button.href === window.location.href) {
      button.classList.add('active-btn')
    }
    else{
      allButton.classList.add('active-btn')
    };
  });
};

export { activeBtn };
