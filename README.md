# Vicky Wang: Personal Website

Personal academic and professional website for **Vicky Y. Wang, MHI**, PhD student in Health Services Research and Policy at the University of Pittsburgh School of Public Health.

**Live site:** https://YOUR-USERNAME.github.io/me/

## About

A single-page static site with three sections:

- **About Me**: bio, education and skills
- **Experience**: professional, teaching, research, practice and community, and other work
- **Projects**: selected research and community data projects

Each section has its own link (`#about`, `#experience`, `#projects`), and the Experience sub-tabs do too (for example `#experience/research`).

The site was originally built as an R Shiny app and exported with Shinylive. It has since been rebuilt as plain HTML, CSS and JavaScript so it loads instantly instead of waiting on an in-browser R runtime. There is no build step and no dependencies.

## Repository structure

```
.
├── index.html          # The whole site: content, styles and tab logic
├── img/
│   ├── headshot.webp
│   ├── mhaction.webp
│   └── a2sf.webp
├── favicon-32.png
├── favicon-64.png
├── favicon-180.png
└── README.md
```

## Running locally

Open `index.html` in a browser, or serve the folder with any static server:

```bash
python3 -m http.server 8000
```

Then visit http://localhost:8000.

## Editing content

Everything lives in `index.html`:

- **Text and entries:** each job, project or education item is an `entry-card` or `<p>` block in the HTML body. Edit or copy one to add another.
- **Colors and fonts:** the palette is defined as CSS variables at the top of the `<style>` block (`--brown-deep`, `--green`, `--orange`, and so on).
- **Images:** replace the files in `img/`. Keep the filenames lowercase, since GitHub Pages is case-sensitive. Use WebP or compressed images to keep the page fast.

## Deployment

The site is hosted with GitHub Pages:

1. Push changes to the `main` branch.
2. In the repository, go to **Settings → Pages**.
3. Set the source to **Deploy from a branch**, choose `main` and `/ (root)`, then save.

Changes usually go live within a minute or two. If an update doesn't show up, do a hard refresh (Cmd/Ctrl+Shift+R).

## Tech

- HTML, CSS and vanilla JavaScript
- Fonts: [Lora](https://fonts.google.com/specimen/Lora) and [Archivo Narrow](https://fonts.google.com/specimen/Archivo+Narrow) via Google Fonts
- Icons: inline SVG (Font Awesome glyphs)

## Contact

- Email: [viw95@pitt.edu](mailto:viw95@pitt.edu)
- LinkedIn: https://www.linkedin.com/in/viwa
- GitHub: https://github.com/viwack

## License

© Vicky Wang. All rights reserved. Please don't reuse the text, photos or personal content without permission.