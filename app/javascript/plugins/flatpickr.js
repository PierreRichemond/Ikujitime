import flatpickr from "flatpickr";

const initFlatpickr = () => {
  flatpickr(".datepicker", {});
  flatpickr(".datepicker", {
    enableTime: true
  });
}

export { initFlatpickr };
