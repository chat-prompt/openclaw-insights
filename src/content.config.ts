import { defineCollection, z } from 'astro:content';
import { glob } from 'astro/loaders';

const insights = defineCollection({
  loader: glob({ pattern: '**/*.md', base: './src/content/insights' }),
  schema: z.object({
    title: z.string(),
    date: z.string().optional(),
    description: z.string().optional(),
    category: z.string().optional(),
    order: z.number().optional(),
    token: z.string().optional(),
  }),
});

const daily = defineCollection({
  loader: glob({ pattern: '**/*.md', base: './src/content/daily' }),
  schema: z.object({
    title: z.string(),
    date: z.string(),
    description: z.string().optional(),
    messageCount: z.number().optional(),
    token: z.string().optional(),
  }),
});

const reports = defineCollection({
  loader: glob({ pattern: '**/*.md', base: './src/content/reports' }),
  schema: z.object({
    title: z.string(),
    date: z.string(),
    description: z.string().optional(),
    htmlFile: z.string(),
    order: z.number().optional(),
    token: z.string().optional(),
  }),
});

export const collections = { insights, daily, reports };
