-- 1. How many powers are there?

SELECT COUNT (*) FROM powers;


-- 2. List all heroes and their powers. It's okay that heroes appear multiple times.

SELECT heroes.name, powers.name, powers.description FROM heroes_powers
JOIN heroes on heroes.id = heroes_powers.hero_id
JOIN powers on powers.id = heroes_powers.power_id;

-- 3. Find all of Professor X's powers.

SELECT powers.name, powers.description FROM heroes_powers
JOIN heroes on heroes.id = heroes_powers.hero_id
JOIN powers on powers.id = heroes_powers.power_id
WHERE heroes.name = 'Professor X';

-- 4. Add a new super power. 

INSERT INTO powers (name, description) VALUES ('power walking', 'walking at extreme speeds');

-- 5. Add this power to an existing hero.

INSERT INTO heroes_powers (hero_id, power_id, power_level) VALUES (3, 9, 2);

-- 6. Which heroes have laser vision? Include their name and alias.

SELECT heroes.name, heroes.alias FROM heroes_powers
JOIN heroes on heroes.id = heroes_powers.hero_id
JOIN powers on powers.id = heroes_powers.power_id
WHERE powers.name = 'Laser Vision';

-- 7. How many can fly? A twist on the above...

SELECT heroes.name, heroes.alias FROM heroes_powers
JOIN heroes on heroes.id = heroes_powers.hero_id
JOIN powers on powers.id = heroes_powers.power_id
WHERE powers.name = 'Flight';

-- 8. What is the average super strength power level?

SELECT AVG(heroes_powers.power_level) FROM heroes_powers
JOIN powers on powers.id = heroes_powers.power_id
WHERE powers.name = 'Super Strength';

-- 9. Show all the information for heroes with super strength power level over 2.

SELECT * FROM heroes
JOIN heroes_powers on heroes.id = heroes_powers.hero_id
JOIN powers on powers.id = heroes_powers.power_id
WHERE heroes_powers.power_level > 2;


-- 10. Find the average power level for all powers. Include the power name and descriptions.

SELECT powers.name, powers.description, AVG(heroes_powers.power_level) FROM heroes_powers
JOIN heroes on heroes.id = heroes_powers.hero_id
JOIN powers on powers.id = heroes_powers.power_id
GROUP BY powers.name, powers.description;
