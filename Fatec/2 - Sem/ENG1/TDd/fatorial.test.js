const fatorial = require('./fatorial');

test('Fatorial de 3', () => {
    expect(fatorial(3)).toBe(2);
});

test('Fatorial de 2', () => {
    expect(fatorial(2)).toBe(2);
});

test('Fatorial de 6', () => {
    expect(fatorial(6)).toBe(720);
});

test('Fatorial de 4', () => {
    expect(fatorial(4)).toBe(24);
});

test('Fatorial de 5', () => {
    expect(fatorial(5)).toBe(120);
});
