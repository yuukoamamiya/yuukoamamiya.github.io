# hugo-bear-blog-extended

An extended fork of [Hugo Bear Blog](https://github.com/janraasch/hugo-bearblog) — free, no-nonsense, super-fast blogging. This fork adds features the author needed for their own blog while keeping the minimal aesthetic.

> This is a one-time fork. It does **not** track upstream; all development happens here.

## Features

- Paginated home page (configurable `pagination.pagerSize`)
- Full-content RSS feed
- Client-side full-text search with IndexedDB caching (`content/page/search.md` + `layouts/page/search.html` + `layouts/_default/single.json.json`)
- Archives page grouped by year (`content/page/archives.md` + `layouts/page/archives.html`)
- Categories / tags taxonomies
- DisqusJS comments with deep-dark-mode styling
- Lazy-loaded images with CLS placeholders (first image eager)
- Worg-style floating table of contents (mobile falls back inline)
- Light / dark / auto theme toggle (localStorage persisted)
- Google Analytics + Cloudflare Web Analytics, lazily loaded

> The author's live blog also has a Douban recent books/movies/music badge, but that is a
> **site-specific module kept out of this theme** — the site overrides `custom_body.html` /
> `style.html` to inject it. If you want one, write your own badge partial in your site's
> `layouts/partials/` and add it to your overridden assemblers.

## Quick start

In `hugo.toml` / `config.yaml`:

```yaml
theme: hugo-bear-blog-extended
```

Then create the pages that need front matter:

```markdown
# content/page/search.md
---
title: "Search"
slug: "search"
layout: "search"
outputs: [html, json]
noindex: true
excludeFromSitemap: true
---

# content/page/archives.md
---
title: "Archives"
layout: "archives"
slug: "archives"
---
```

All behaviour is driven by `params` (see the theme author's `config.yaml` for a full example). Feature toggles:

| Feature | Config |
| --- | --- |
| Search | page `content/page/search.md` |
| Archives | page `content/page/archives.md` |
| Comments | `params.disqusjs.enabled` + top-level `disqusShortname` |
| Analytics | `params.googleAnalytics.enabled` / `params.cloudflareWebAnalytics.enabled` |
| Post navigator | `params.enablePostNavigator` |
| TOC | per-post front matter `toc: false` to disable |

### Optional / dependency fields

Everything is `params`-driven; none of these are required for a minimal site:

| Field | Default | Notes |
| --- | --- | --- |
| `params.preconnectHosts` | `[]` | list of image/CDN hosts to preconnect. Empty = no preconnect |
| `params.googleAnalytics.proxy` | empty | self-hosted reverse proxy used as a fallback when gtag.js can't load. Empty = official gtag only |
| `params.cloudflareWebAnalytics.token` | empty | only needed if you enable Cloudflare Web Analytics (requires a Cloudflare account) |
| `params.disqusjs.apiUrl` / `apiKey` | empty | DisqusJS needs an API reverse proxy + a Disqus public key; disable `disqusjs.enabled` if you don't want comments |

Minimal `config.yaml` — works with no external service at all:

```yaml
baseURL: https://example.com
locale: en
title: My Blog
theme: hugo-bear-blog-extended
pagination:
    pagerSize: 10
params:
    description: Just my thoughts.
```

## Module map

Every feature lives in `layouts/partials/`:

- `preconnect.html` — DNS preconnect hints for `params.preconnectHosts` (head)
- `analytics.html` — GA + Cloudflare Web Analytics (head)
- `theme-toggle.html` — light/dark/auto toggle script (body)
- `table-wrap.html` — wraps markdown tables for horizontal scroll (body)
- `comments.html` — DisqusJS (body)
- `toc.html` — table of contents (article header)
- `term-content.html` — shared category/tag list rendering
- `seo_tags.html` — Open Graph / Twitter / JSON-LD
- `style.html` — CSS assembler; each feature's CSS lives in `partials/css/`
- `custom_head.html` / `custom_body.html` — head/body assemblers

## License

[MIT](LICENSE). The original [Hugo Bear Blog](https://github.com/janraasch/hugo-bearblog) license applies to the base, modifications are licensed under the same terms.

## Credits

- Design inspired by [Bear Blog](https://bearblog.dev) by Herman Martinus — [Bear Blog License 2.0](https://github.com/HermanMartinus/bearblog/blob/main/LICENSE.md)
- Code derived from [Hugo Bear Blog](https://github.com/janraasch/hugo-bearblog) by Jan Raasch — MIT License
