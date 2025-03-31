import { Antagonist, Category } from '../base';

export const OPERATIVE_MECHANICAL_DESCRIPTION = `
  Retrieve the nuclear authentication disk, use it to activate the nuclear
  fission explosive, and destroy the station.
`;

const Operative: Antagonist = {
  key: 'operative',
  name: 'Rebel Operative',
  description: [
    `
      You've arrived as part of a rebel strike team to assault the city.
      Complete the mission, or die trying.
    `,

    OPERATIVE_MECHANICAL_DESCRIPTION,
  ],
  category: Category.Roundstart,
};

export default Operative;
