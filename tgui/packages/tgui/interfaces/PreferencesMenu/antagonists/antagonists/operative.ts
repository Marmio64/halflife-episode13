import { Antagonist, Category } from '../base';

export const OPERATIVE_MECHANICAL_DESCRIPTION = `
  Lower the sociostability of the district low enough to deploy a super destabilizer in the nexus.
`;

const Operative: Antagonist = {
  key: 'operative',
  name: 'Uprising Ringleader',
  description: [
    `
      This district has had enough of the combine's tyranny.
      An uprising has been due for too long, and we shall cut off the district's
      communication with combine forces and crush all that remain.
    `,

    OPERATIVE_MECHANICAL_DESCRIPTION,
  ],
  category: Category.Roundstart,
};

export default Operative;
