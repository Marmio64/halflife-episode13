export const ANTAG2COLOR = {
  Abductors: 'pink',
  'Ash Walkers': 'olive',
  Biohazards: 'brown',
  'Bounty Hunters': 'yellow',
  CentCom: 'teal',
  'Digital Anomalies': 'teal',
  'Emergency Response Team': 'teal',
  'Escaped Fugitives': 'orange',
  'Xenomorph Infestation': 'violet',
  'Spacetime Aberrations': 'white',
  'Deviant Crew': 'white',
  'Invasive Overgrowth': 'green',
} as const;

type Department = {
  color: string;
  trims: string[];
};

export const DEPARTMENT2COLOR: Record<string, Department> = {
  cargo: {
    color: 'brown',
    trims: ['Bitrunner', 'Union Worker', 'Union Miner', 'Union Foreman'],
  },
  command: {
    color: 'blue',
    trims: ['Warden', 'Labor Lead'],
  },
  engineering: {
    color: 'orange',
    trims: ['Infestation Control', 'Chief Engineer', 'Union Engineer'],
  },
  medical: {
    color: 'teal',
    trims: [
      'Chemist',
      'Chief Medical Officer',
      'Coroner',
      'Correctional Physician',
      'Paramedic',
    ],
  },
  science: {
    color: 'pink',
    trims: ['Geneticist', 'Research Director', 'Roboticist', 'Union Scientist'],
  },
  security: {
    color: 'red',
    trims: [
      'Detective',
      'Divisional Lead',
      'Civil Protection Officer',
      'Overseer',
    ],
  },
  service: {
    color: 'green',
    trims: [
      'Bartender',
      'Botanist',
      'Chaplain',
      'Chef',
      'Clown',
      'Cook',
      'Clerk',
      'Vortigaunt Slave',
      'Lawyer',
      'Mime',
      'Psychologist',
    ],
  },
};

export const THREAT = {
  Low: 1,
  Medium: 5,
  High: 8,
} as const;

export const HEALTH = {
  Good: 69, // nice
  Average: 19,
  Bad: 0,
  Crit: -30,
  Dead: -100,
  Ruined: -200,
} as const;

export const VIEWMODE = {
  Health: 'heart',
  Orbiters: 'ghost',
  Department: 'id-badge',
} as const;
