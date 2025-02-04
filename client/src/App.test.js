import { render, screen } from '@testing-library/react';
import App from './App';
function sum(a,b)
{
  return a + b;
}

test('addition correcte', () => {
  expect(sum(2, 3)).toEqual(5); // Ce test réussira
});
/*
test('addition incorrecte', () => {
  expect(sum(2, 3)).toBe(6); // Ce test échouera
});
*/
