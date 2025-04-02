import { Antagonist, Category } from '../base';

const BloodBrother: Antagonist = {
  key: 'bloodbrother',
  name: 'Rebel Brother',
  description: [
    `
      You've been implanted here as part of a rebel cell. Convince others to join your cause, and bring freedom to the district.
    `,
  ],
  category: Category.Roundstart,
};

export default BloodBrother;
