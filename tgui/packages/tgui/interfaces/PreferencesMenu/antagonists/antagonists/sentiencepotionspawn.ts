import { Antagonist, Category } from '../base';

const SentientCreature: Antagonist = {
  key: 'sentiencepotionspawn',
  name: 'Xenian Creature',
  description: [
    `
		By some happen chance, you are now a xenian alien.
	  `,

    `
		This is a blanket preference for all sentient xenian creatures, which includes vortigaunts, antlions, zombies, etc.
	  `,
  ],
  category: Category.Midround,
};

export default SentientCreature;
