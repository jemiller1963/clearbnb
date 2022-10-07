function calculateDaysBetweenDates(begin, end) {
  const start = new Date(begin);
  const endDate = new Date(end);
  const diff = endDate.getTime() - start.getTime();
  const days = Math.floor(diff / (1000 * 60 * 60 * 24));
  return days;
}


