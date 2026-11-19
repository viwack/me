library(shiny)
library(htmltools)

# Local preview:  shiny::runApp()   (run from this folder)
# Static export:  source("build.R") (writes the GitHub Pages site to docs/)
# Images, favicons and the CV PDF live in www/ (Shiny serves that folder at the site root).

options(shiny.autoreload = TRUE)  # refresh the preview automatically when you save

ui <- tags$html(
  lang = "en",
  tags$head(
    tags$meta(
      charset = "UTF-8"
    ),
    tags$meta(
      name = "viewport",
      content = "width=device-width, initial-scale=1.0"
    ),
    tags$title(
      "Vicky Wang"
    ),
    tags$link(
      rel = "icon",
      type = "image/png",
      sizes = "32x32",
      href = "./favicon-32.png"
    ),
    tags$link(
      rel = "icon",
      type = "image/png",
      sizes = "64x64",
      href = "./favicon-64.png"
    ),
    tags$link(
      rel = "apple-touch-icon",
      sizes = "180x180",
      href = "./favicon-180.png"
    ),
    tags$link(
      rel = "preconnect",
      href = "https://fonts.googleapis.com"
    ),
    tags$link(
      rel = "preconnect",
      href = "https://fonts.gstatic.com",
      crossorigin = ""
    ),
    tags$link(
      rel = "stylesheet",
      href = "https://fonts.googleapis.com/css2?family=Lora:ital,wght@0,400..700;1,400..700&family=Archivo+Narrow:wght@500;600;700&display=swap"
    ),
    tags$style(
      HTML(
        "\n",
        ":root {\n",
        "  --brown-deep: #3E2723;\n",
        "  --brown: #6D4C34;\n",
        "  --brown-light: #A1887F;\n",
        "  --green-deep: #33691E;\n",
        "  --green: #556B2F;\n",
        "  --orange-deep: #C1541A;\n",
        "  --orange: #D9793F;\n",
        "  --cream: #FAF6F0;\n",
        "  --hairline: #E4DACB;\n",
        "}\n",
        "\n",
        "* {\n",
        "  box-sizing: border-box;\n",
        "}\n",
        "\n",
        "html, body {\n",
        "  background: var(--cream) !important;\n",
        "  font-family: 'Lora', serif;\n",
        "  color: #2B2320;\n",
        "  line-height: 1.7;\n",
        "  font-size: 16px;\n",
        "}\n",
        "\n",
        ".container-fluid {\n",
        "  max-width: 980px;\n",
        "}\n",
        "\n",
        "h2, h3, h4, h5 {\n",
        "  font-family: 'Archivo Narrow', sans-serif;\n",
        "  color: var(--brown-deep);\n",
        "  font-weight: 600;\n",
        "  letter-spacing: 0.2px;\n",
        "}\n",
        "\n",
        "h2 {\n",
        "  margin-top: 0;\n",
        "  font-size: 28px;\n",
        "  padding-bottom: 12px;\n",
        "  border-bottom: 2px solid var(--orange);\n",
        "  margin-bottom: 20px;\n",
        "}\n",
        "\n",
        "h3 {\n",
        "  font-size: 20px;\n",
        "  color: var(--brown);\n",
        "  margin-top: 4px;\n",
        "}\n",
        "\n",
        "h4 {\n",
        "  font-size: 15px;\n",
        "  text-transform: uppercase;\n",
        "  letter-spacing: 0.8px;\n",
        "  color: var(--green-deep);\n",
        "  margin-bottom: 6px;\n",
        "}\n",
        "\n",
        "strong {\n",
        "  color: var(--brown-deep);\n",
        "}\n",
        "\n",
        "p {\n",
        "  color: #3A322D;\n",
        "  font-size: 16px;\n",
        "}\n",
        "\n",
        "/* Just the opening bio on the About page — sized up to feel proportionate to the big profile photo */\n",
        ".intro-bio p {\n",
        "  font-size: 22px;\n",
        "  line-height: 1.6;\n",
        "}\n",
        "\n",
        "/* Content sections: flat, separated by a hairline instead of boxed cards */\n",
        ".content-box {\n",
        "  background: transparent;\n",
        "  margin-bottom: 6px;\n",
        "  padding: 26px 6px;\n",
        "  border-bottom: 1px solid var(--hairline);\n",
        "}\n",
        "\n",
        ".content-box:last-child {\n",
        "  border-bottom: none;\n",
        "}\n",
        "\n",
        "/* Individual items (jobs, projects) get their own visible container */\n",
        ".entry-card {\n",
        "  background: #FFFFFF;\n",
        "  border: 1px solid var(--hairline);\n",
        "  border-left: 4px solid var(--orange);\n",
        "  border-radius: 5px;\n",
        "  padding: 22px 26px;\n",
        "  margin-bottom: 22px;\n",
        "}\n",
        "\n",
        ".entry-card:last-child {\n",
        "  margin-bottom: 0;\n",
        "}\n",
        "\n",
        ".entry-card p {\n",
        "  margin-bottom: 10px;\n",
        "}\n",
        "\n",
        "/* Top navbar (replaces the old sidebar) */\n",
        ".navbar-default {\n",
        "  background: var(--cream) !important;\n",
        "  border: none !important;\n",
        "  border-bottom: 1px solid var(--hairline) !important;\n",
        "  border-radius: 0 !important;\n",
        "  margin-bottom: 0;\n",
        "}\n",
        "\n",
        ".navbar-default .navbar-brand {\n",
        "  font-family: 'Archivo Narrow', sans-serif !important;\n",
        "  font-weight: 700 !important;\n",
        "  letter-spacing: 0.3px;\n",
        "  color: var(--brown-deep) !important;\n",
        "  font-size: 28px;\n",
        "  height: auto;\n",
        "  padding-top: 15px;\n",
        "  padding-bottom: 15px;\n",
        "}\n",
        "\n",
        ".navbar-default .navbar-brand a {\n",
        "  color: inherit !important;\n",
        "  text-decoration: none !important;\n",
        "  border-bottom: none !important;\n",
        "}\n",
        "\n",
        ".navbar-default .navbar-nav {\n",
        "  float: right !important;\n",
        "}\n",
        "\n",
        ".navbar-default .navbar-nav > li > a {\n",
        "  color: var(--brown-deep) !important;\n",
        "  font-family: 'Archivo Narrow', sans-serif;\n",
        "  font-weight: 600;\n",
        "  font-size: 15px;\n",
        "  letter-spacing: 0.3px;\n",
        "  border-bottom: 3px solid transparent;\n",
        "  background: transparent !important;\n",
        "  transition: color 0.15s ease, border-color 0.15s ease;\n",
        "  padding-top: 18px;\n",
        "  padding-bottom: 15px;\n",
        "}\n",
        "\n",
        ".navbar-default .navbar-nav > li > a:hover,\n",
        ".navbar-default .navbar-nav > li > a:focus {\n",
        "  color: var(--orange-deep) !important;\n",
        "  border-bottom: 3px solid var(--orange) !important;\n",
        "  background: transparent !important;\n",
        "}\n",
        "\n",
        ".navbar-default .navbar-nav > li.active > a,\n",
        ".navbar-default .navbar-nav > li.active > a:hover,\n",
        ".navbar-default .navbar-nav > li.active > a:focus {\n",
        "  color: var(--green-deep) !important;\n",
        "  border-bottom: 3px solid var(--green) !important;\n",
        "  background: transparent !important;\n",
        "  font-weight: 700;\n",
        "}\n",
        "\n",
        ".navbar-default .navbar-toggle {\n",
        "  border-color: var(--hairline);\n",
        "}\n",
        "\n",
        ".navbar-default .navbar-toggle .icon-bar {\n",
        "  background-color: var(--brown-deep);\n",
        "}\n",
        "\n",
        "/* Sub-tabs (used to split Experience into groups) */\n",
        ".nav-tabs {\n",
        "  border-bottom: 1px solid var(--hairline);\n",
        "  margin-bottom: 20px;\n",
        "}\n",
        "\n",
        ".nav-tabs > li > a {\n",
        "  color: var(--brown) !important;\n",
        "  font-family: 'Archivo Narrow', sans-serif;\n",
        "  font-weight: 600;\n",
        "  font-size: 13px;\n",
        "  letter-spacing: 0.3px;\n",
        "  border: none !important;\n",
        "  border-bottom: 3px solid transparent !important;\n",
        "  background: transparent !important;\n",
        "  border-radius: 0 !important;\n",
        "  margin-right: 6px;\n",
        "}\n",
        "\n",
        ".nav-tabs > li > a:hover {\n",
        "  color: var(--orange-deep) !important;\n",
        "  border-bottom: 3px solid var(--orange) !important;\n",
        "  background: transparent !important;\n",
        "}\n",
        "\n",
        ".nav-tabs > li.active > a,\n",
        ".nav-tabs > li.active > a:hover,\n",
        ".nav-tabs > li.active > a:focus {\n",
        "  color: var(--green-deep) !important;\n",
        "  border-bottom: 3px solid var(--green) !important;\n",
        "  background: transparent !important;\n",
        "  font-weight: 700;\n",
        "}\n",
        "\n",
        ".tab-content {\n",
        "  padding-top: 6px;\n",
        "}\n",
        "\n",
        ".tab-pane .content-box:first-child {\n",
        "  padding-top: 4px;\n",
        "}\n",
        "\n",
        "/* Buttons: quiet outline style, fills in on hover, no bounce */\n",
        ".btn {\n",
        "  background: transparent;\n",
        "  color: var(--orange-deep) !important;\n",
        "  border: 1px solid var(--orange-deep);\n",
        "  border-radius: 3px;\n",
        "  margin: 5px 5px 5px 0;\n",
        "  padding: 7px 18px;\n",
        "  font-family: 'Archivo Narrow', sans-serif;\n",
        "  font-weight: 600;\n",
        "  font-size: 13px;\n",
        "  letter-spacing: 0.3px;\n",
        "  box-shadow: none;\n",
        "  transition: background 0.15s ease, color 0.15s ease;\n",
        "}\n",
        "\n",
        ".btn:hover {\n",
        "  background: var(--orange-deep);\n",
        "  color: var(--cream) !important;\n",
        "}\n",
        "\n",
        ".btn-primary {\n",
        "  color: var(--green-deep) !important;\n",
        "  border: 1px solid var(--green-deep) !important;\n",
        "  background: transparent !important;\n",
        "}\n",
        "\n",
        ".btn-primary:hover {\n",
        "  background: var(--green-deep) !important;\n",
        "  color: var(--cream) !important;\n",
        "}\n",
        "\n",
        "img {\n",
        "  display: block;\n",
        "  margin-left: auto;\n",
        "  margin-right: auto;\n",
        "}\n",
        "\n",
        ".hero-photo {\n",
        "  display: flex;\n",
        "  justify-content: center;\n",
        "  margin: 10px 0 20px 0;\n",
        "}\n",
        "\n",
        ".hero-photo img {\n",
        "  border-radius: 50%;\n",
        "  width: 260px !important;\n",
        "  height: 260px !important;\n",
        "  border: 1px solid var(--hairline);\n",
        "}\n",
        "\n",
        ".timeline {\n",
        "  position: relative;\n",
        "  max-width: 600px;\n",
        "  margin: 20px auto;\n",
        "  padding: 20px 0;\n",
        "}\n",
        "\n",
        ".timeline:before {\n",
        "  content: '';\n",
        "  position: absolute;\n",
        "  width: 2px;\n",
        "  background: var(--hairline);\n",
        "  top: 0;\n",
        "  bottom: 0;\n",
        "  left: 30px;\n",
        "  margin-left: -1px;\n",
        "}\n",
        "\n",
        ".timeline-event {\n",
        "  padding: 20px;\n",
        "  position: relative;\n",
        "  background-color: inherit;\n",
        "  width: 100%;\n",
        "}\n",
        "\n",
        ".timeline-event:after {\n",
        "  content: '';\n",
        "  display: table;\n",
        "  clear: both;\n",
        "}\n",
        "\n",
        ".timeline-content {\n",
        "  padding: 18px 20px;\n",
        "  background-color: transparent;\n",
        "  position: relative;\n",
        "  border-radius: 0;\n",
        "  width: 80%;\n",
        "  border-bottom: 1px solid var(--hairline);\n",
        "}\n",
        "\n",
        ".timeline-content.left {\n",
        "  left: 70px;\n",
        "}\n",
        "\n",
        ".timeline-content.right {\n",
        "  left: 150px;\n",
        "}\n",
        "\n",
        ".timeline-point {\n",
        "  width: 10px;\n",
        "  height: 10px;\n",
        "  background: var(--orange-deep);\n",
        "  border: none;\n",
        "  position: absolute;\n",
        "  left: 25px;\n",
        "  top: 24px;\n",
        "  border-radius: 50%;\n",
        "  z-index: 1;\n",
        "}\n",
        "\n",
        "a {\n",
        "  color: var(--green-deep);\n",
        "  text-decoration: none;\n",
        "  border-bottom: 1px solid transparent;\n",
        "}\n",
        "\n",
        "a:hover {\n",
        "  color: var(--orange-deep);\n",
        "  border-bottom: 1px solid var(--orange-deep);\n",
        "}\n",
        "\n",
        "::-webkit-scrollbar {\n",
        "  width: 8px;\n",
        "}\n",
        "\n",
        "::-webkit-scrollbar-track {\n",
        "  background: var(--cream);\n",
        "}\n",
        "\n",
        "::-webkit-scrollbar-thumb {\n",
        "  background: var(--brown-light);\n",
        "  border-radius: 4px;\n",
        "}\n",
        "\n",
        "/* Footnote-style contact footer, shown at the bottom of every tab */\n",
        ".site-footer {\n",
        "  max-width: 980px;\n",
        "  margin: 10px auto 0 auto;\n",
        "  padding: 16px 6px 28px 6px;\n",
        "  border-top: 1px solid var(--hairline);\n",
        "  text-align: center;\n",
        "  font-size: 13px;\n",
        "  color: var(--brown-light);\n",
        "  font-family: 'Archivo Narrow', sans-serif;\n",
        "  letter-spacing: 0.3px;\n",
        "}\n",
        "\n",
        ".site-footer a {\n",
        "  color: var(--brown-light);\n",
        "  border-bottom: none;\n",
        "  margin: 0 8px;\n",
        "}\n",
        "\n",
        ".site-footer a:hover {\n",
        "  color: var(--orange-deep);\n",
        "}/* ---- layout replacing Bootstrap ---- */\n",
        ".container-fluid{margin:0 auto;padding:0 15px;width:100%}\n",
        "main.container-fluid{max-width:980px}\n",
        ".navbar-default .navwrap{max-width:none;display:flex;align-items:center;justify-content:space-between;flex-wrap:wrap}\n",
        ".navbar-brand{display:block}\n",
        ".navbar-nav{list-style:none;margin:0;padding:0;display:flex;float:none !important}\n",
        ".navbar-nav>li>a,.nav-tabs>li>a{display:block;position:relative;cursor:pointer}\n",
        ".navbar-nav>li>a{padding:18px 15px 15px}\n",
        ".navbar-toggle{display:none;background:transparent;border:1px solid var(--hairline);border-radius:4px;padding:9px 10px;cursor:pointer}\n",
        ".navbar-toggle .icon-bar{display:block;width:22px;height:2px;margin:4px 0;border-radius:1px}\n",
        ".navbar-nav>li.active>a,.nav-tabs>li.active>a{}\n",
        ".nav-tabs{list-style:none;padding:0;display:flex;flex-wrap:wrap}\n",
        ".nav-tabs>li>a{padding:10px 15px}\n",
        ".row{display:flex;flex-wrap:wrap;margin:0 -15px;align-items:flex-start}\n",
        ".col7{flex:0 0 58.333%;max-width:58.333%;padding:0 15px}\n",
        ".col5{flex:0 0 41.667%;max-width:41.667%;padding:0 15px}\n",
        ".btn{display:inline-block;cursor:pointer;text-align:center;line-height:1.5}\n",
        ".btn:hover{border-bottom:1px solid var(--orange-deep)}\n",
        ".page,.subpage{display:none}\n",
        ".page.active,.subpage.active{display:block}\n",
        "ol{padding-left:22px}\n",
        "li{margin-bottom:8px}\n",
        "a:hover{text-decoration:none}\n",
        "@media (max-width:767px){\n",
        "  .navbar-toggle{display:block}\n",
        "  .navbar-nav{display:none;width:100%;flex-direction:column}\n",
        "  .navbar-nav.open{display:flex}\n",
        "  .col7,.col5{flex:0 0 100%;max-width:100%}\n",
        "  .intro-bio p{font-size:18px}\n",
        "  .timeline-content{width:100%}\n",
        "}\n",
        "\n",
        "/* ---- sidebar layout ---- */\n",
        ".navbar-default .navwrap{max-width:1180px}\n",
        ".layout{max-width:1180px;margin:0 auto;padding:0 15px;display:grid;grid-template-columns:240px minmax(0,1fr);gap:44px;align-items:start}\n",
        ".sidebar{position:sticky;top:24px;padding:30px 0;text-align:center}\n",
        ".sidebar-photo{width:200px;height:200px;border-radius:50%;object-fit:cover;border:1px solid var(--hairline);margin:0 auto 18px}\n",
        ".sidebar p{margin:0 0 10px;line-height:1.4}\n",
        ".sidebar-role{font-family:'Archivo Narrow',sans-serif;font-size:17px;color:var(--brown-deep)}\n",
        ".sidebar-role strong{font-size:19px}\n",
        ".sidebar-affil{font-size:14px;color:var(--brown)}\n",
        ".sidebar-links{margin-top:14px}\n",
        ".sidebar-links a{color:var(--brown);margin:0 8px;border-bottom:none}\n",
        ".sidebar-links a:hover{color:var(--orange-deep);border-bottom:none}\n",
        ".content{min-width:0}\n",
        ".intro-bio p{font-size:19px}\n",
        ".site-footer{max-width:1180px}\n",
        "/* ---- publications ---- */\n",
        ".pub-card{display:flex;gap:24px;background:#fff;border:1px solid var(--hairline);border-left:4px solid var(--orange);border-radius:5px;padding:22px 26px;margin-bottom:22px}\n",
        ".pub-thumb{flex:0 0 220px;width:220px;height:auto;align-self:flex-start;border:1px solid var(--hairline);border-radius:4px;margin:0;background:var(--cream)}\n",
        ".pub-body{flex:1;min-width:0}\n",
        ".pub-title{text-transform:none;letter-spacing:.2px;font-size:19px;line-height:1.35;color:var(--brown-deep);margin:0 0 8px}\n",
        ".pub-title a{color:var(--brown-deep)}\n",
        ".pub-title a:hover{color:var(--orange-deep)}\n",
        ".pub-authors{margin-bottom:4px;font-size:15px}\n",
        ".pub-venue{margin-bottom:10px;font-size:14px;color:var(--brown)}\n",
        ".pub-desc{font-size:15px;margin-bottom:8px}\n",
        "@media (max-width:860px){\n",
        "  .layout{grid-template-columns:1fr;gap:0}\n",
        "  .sidebar{position:static;padding:22px 0 6px;border-bottom:1px solid var(--hairline)}\n",
        "  .sidebar-photo{width:140px;height:140px}\n",
        "  .pub-card{flex-direction:column}\n",
        "  .pub-thumb{flex:none;width:100%;max-width:360px}\n",
        "}\n",
        "\n",
        "/* ---- CV embed ---- */\n",
        ".cv-frame{width:100%;height:80vh;min-height:520px;border:1px solid var(--hairline);border-radius:4px;background:#fff;margin-top:10px}\n",
        ".cv-note{font-size:13px;color:var(--brown-light);margin-top:8px}\n",
        "@media (max-width:860px){.cv-frame{display:none}}\n",
        "@media (min-width:861px){.cv-note{display:none}}\n",
        "\n"
      )
    )
  ),
  tags$body(
    tags$header(
      class = "navbar-default",
      tags$div(
        class = "container-fluid navwrap",
        tags$div(
          class = "navbar-brand",
          tags$a(
            href = "#about",
            "Vicky Y. Wang, MHI"
          )
        ),
        tags$button(
          class = "navbar-toggle",
          `aria-label` = "Menu",
          `aria-expanded` = "false",
          tags$span(
            class = "icon-bar"
          ),
          tags$span(
            class = "icon-bar"
          ),
          tags$span(
            class = "icon-bar"
          )
        ),
        tags$ul(
          class = "navbar-nav",
          id = "mainnav",
          tags$li(
            `data-tab` = "about",
            tags$a(
              href = "#about",
              "About Me"
            )
          ),
          tags$li(
            `data-tab` = "experience",
            tags$a(
              href = "#experience",
              "Experience"
            )
          ),
          tags$li(
            `data-tab` = "projects",
            tags$a(
              href = "#projects",
              "Projects"
            )
          ),
          tags$li(
            `data-tab` = "publications",
            tags$a(
              href = "#publications",
              "Publications"
            )
          ),
          tags$li(
            `data-tab` = "cv",
            tags$a(
              href = "#cv",
              "CV"
            )
          )
        )
      )
    ),
    tags$div(
      class = "layout",
      tags$aside(
        class = "sidebar",
        tags$img(
          class = "sidebar-photo",
          src = "img/headshot.webp",
          width = "200",
          height = "200",
          alt = "Vicky Wang headshot",
          fetchpriority = "high"
        ),
        tags$p(
          class = "sidebar-role",
          tags$strong(
            "PhD Student"
          ),
          tags$br(),
          "Health Services Research and Policy"
        ),
        tags$p(
          class = "sidebar-affil",
          "University of Pittsburgh",
          tags$br(),
          "School of Public Health"
        ),
        tags$div(
          class = "sidebar-links",
          tags$a(
            href = "https://www.linkedin.com/in/viwa",
            target = "_blank",
            rel = "noopener",
            `aria-label` = "LinkedIn",
            tags$svg(
              viewBox = "0 0 448 512",
              width = "16",
              height = "16",
              fill = "currentColor",
              tags$path(
                d = "M100.3 448H7.4V148.9h92.9zM53.8 108.1C24.1 108.1 0 83.5 0 53.8a53.8 53.8 0 0 1 107.6 0c0 29.7-24.1 54.3-53.8 54.3zM447.9 448h-92.7V302.4c0-34.7-.7-79.2-48.3-79.2-48.3 0-55.7 37.7-55.7 76.7V448h-92.8V148.9h89.1v40.8h1.3c12.4-23.5 42.7-48.3 87.9-48.3 94 0 111.3 61.9 111.3 142.3V448z"
              )
            )
          ),
          tags$a(
            href = "https://github.com/viwack",
            target = "_blank",
            rel = "noopener",
            `aria-label` = "GitHub",
            tags$svg(
              viewBox = "0 0 496 512",
              width = "16",
              height = "16",
              fill = "currentColor",
              tags$path(
                d = "M165.9 397.4c0 2-2.3 3.6-5.2 3.6-3.3.3-5.6-1.3-5.6-3.6 0-2 2.3-3.6 5.2-3.6 3-.3 5.6 1.3 5.6 3.6zm-31.1-4.5c-.7 2 1.3 4.3 4.3 4.9 2.6 1 5.6 0 6.2-2s-1.3-4.3-4.3-5.2c-2.6-.7-5.5.3-6.2 2.3zm44.2-1.7c-2.9.7-4.9 2.6-4.6 4.9.3 2 2.9 3.3 5.9 2.6 2.9-.7 4.9-2.6 4.6-4.6-.3-1.9-3-3.2-5.9-2.9zM244.8 8C106.1 8 0 113.3 0 252c0 110.9 69.8 205.8 169.5 239.2 12.8 2.3 17.3-5.6 17.3-12.1 0-6.2-.3-40.4-.3-61.4 0 0-70 15-84.7-29.8 0 0-11.4-29.1-27.8-36.6 0 0-22.9-15.7 1.6-15.4 0 0 24.9 2 38.6 25.8 21.9 38.6 58.6 27.5 72.9 20.9 2.3-16 8.8-27.1 16-33.7-55.9-6.2-112.3-14.3-112.3-110.5 0-27.5 7.6-41.3 23.6-58.9-2.6-6.5-11.1-33.3 2.6-67.9 20.9-6.5 69 27 69 27 20-5.6 41.5-8.5 62.8-8.5s42.8 2.9 62.8 8.5c0 0 48.1-33.6 69-27 13.7 34.7 5.2 61.4 2.6 67.9 16 17.7 25.8 31.5 25.8 58.9 0 96.5-58.9 104.2-114.8 110.5 9.2 7.9 17 22.9 17 46.4 0 33.7-.3 75.4-.3 83.6 0 6.5 4.6 14.4 17.3 12.1C428.2 457.8 496 362.9 496 252 496 113.3 383.5 8 244.8 8z"
              )
            )
          ),
          tags$a(
            href = "mailto:viw95@pitt.edu",
            `aria-label` = "Email",
            tags$svg(
              viewBox = "0 0 512 512",
              width = "16",
              height = "16",
              fill = "currentColor",
              tags$path(
                d = "M48 64C21.5 64 0 85.5 0 112c0 15.1 7.1 29.3 19.2 38.4L236.8 313.6c11.4 8.5 27 8.5 38.4 0L492.8 150.4c12.1-9.1 19.2-23.3 19.2-38.4 0-26.5-21.5-48-48-48H48zM0 176v208c0 35.3 28.7 64 64 64h384c35.3 0 64-28.7 64-64V176L294.4 339.2a63.9 63.9 0 0 1-76.8 0L0 176z"
              )
            )
          )
        )
      ),
      tags$main(
        class = "content",
        tags$section(
          class = "page",
          id = "about",
          tags$div(
            class = "content-box",
            tags$h2(
              "Hi there!"
            ),
            tags$div(
              class = "intro-bio",
              tags$p(
                "Welcome to my site! I am a current PhD student in",
                tags$strong(
                  "Health Services Research and Policy"
                ),
                "at the University of Pittsburgh Graduate School of Public Health. My research interests center on discovering how policy shocks affect federally-regulated health insurance programs. Broadly, I am interested in evaluating the evolution and sustainability of the Affordable Care Act (ACA)."
              ),
              tags$p(
                "I graduated with my Master of Health Informatics from the University of Michigan in 2024. Previously, I was a civil employee at the Centers for Medicare and Medicaid Services (CMS) Center for Consumer Information and Insurance Oversight (CCIIO)."
              ),
              tags$p(
                "I am also an analyst for a federal contractor to CMS, overseeing the technical implementation of a Salesforce-based tool to support annual CCIIO Marketplace Plan Management Group (MPMG) Plan Year Qualified Health Plan Certification activities."
              ),
              tags$p(
                "You can reach me at",
                tags$a(
                  href = "mailto:viw95@pitt.edu",
                  "viw95@pitt.edu"
                ),
                "."
              )
            )
          ),
          tags$div(
            class = "content-box",
            tags$h4(
              tags$strong(
                "Education"
              )
            ),
            tags$p(
              tags$strong(
                "Doctor of Philosophy, Health Services Research and Policy"
              )
            ),
            tags$p(
              "University of Pittsburgh School of Public Health"
            ),
            tags$p(
              "08/2026 - Present"
            ),
            tags$br(),
            tags$p(
              tags$strong(
                "Master of Health Informatics (MHI)"
              )
            ),
            tags$p(
              "University of Michigan"
            ),
            tags$p(
              "08/2023 - 12/2024"
            ),
            tags$br(),
            tags$p(
              tags$strong(
                "Bachelor of Science in Microbiology"
              )
            ),
            tags$p(
              "Minors: Gender and Health, Applied Statistics"
            ),
            tags$p(
              "University of Michigan"
            ),
            tags$p(
              "08/2020 - 05/2023"
            ),
            tags$br(),
            tags$h4(
              tags$strong(
                "Skills"
              )
            ),
            tags$p(
              tags$strong(
                "Software:"
              ),
              "Microsoft Office, Microsoft Access, Google Suite"
            ),
            tags$p(
              tags$strong(
                "Programming:"
              ),
              "R (tidyverse, rshiny), Python (plotly, shinypy), Git/hub, C++, SQL"
            ),
            tags$p(
              tags$strong(
                "Languages:"
              ),
              "Mandarin, German"
            )
          )
        ),
        tags$section(
          class = "page",
          id = "experience",
          tags$div(
            class = "content-box",
            tags$h3(
              "Experiences"
            ),
            tags$ul(
              class = "nav-tabs",
              id = "subnav",
              tags$li(
                `data-sub` = "professional",
                tags$a(
                  href = "#experience/professional",
                  "Professional"
                )
              ),
              tags$li(
                `data-sub` = "teaching",
                tags$a(
                  href = "#experience/teaching",
                  "Teaching"
                )
              ),
              tags$li(
                `data-sub` = "research",
                tags$a(
                  href = "#experience/research",
                  "Research"
                )
              ),
              tags$li(
                `data-sub` = "practice",
                tags$a(
                  href = "#experience/practice",
                  "Practice & Community"
                )
              ),
              tags$li(
                `data-sub` = "fun",
                tags$a(
                  href = "#experience/fun",
                  "Fun Stuff"
                )
              )
            ),
            tags$div(
              class = "subpage",
              id = "sub-professional",
              tags$div(
                class = "entry-card",
                tags$p(
                  tags$strong(
                    "Graduate Student Researcher"
                  )
                ),
                tags$p(
                  "University of Pittsburgh School of Public Health"
                ),
                tags$p(
                  "08/2026 - Present | Pittsburgh, PA"
                ),
                tags$p(
                  "PhD student in Health Services Research and Policy, researching shocks to federally regulated health insurance systems and supporting the long-term sustainability of the Affordable Care Act."
                )
              ),
              tags$div(
                class = "entry-card",
                tags$p(
                  tags$strong(
                    "Business Process Analyst"
                  )
                ),
                tags$p(
                  "General Dynamics Information Technology (GDIT)"
                ),
                tags$p(
                  "06/2025 - Present | Washington, DC"
                ),
                tags$p(
                  "CMS Contractor implementing the Enrollment Community, which manages parent organizations and issuers who offer QHPs in the individual Marketplace. Federal Health Division - Marketplace Eligibility and Enrollment Group, Marketplace Plan Management Group, Centers for Medicare and Medicaid Services."
                )
              ),
              tags$div(
                class = "entry-card",
                tags$p(
                  tags$strong(
                    "Management and Program Analyst"
                  )
                ),
                tags$p(
                  "Centers for Medicare and Medicaid Services (CMS)"
                ),
                tags$p(
                  "01/2025 - 05/2025 | Bethesda, MD"
                ),
                tags$p(
                  "Developing subject matter expertise on individual Marketplace eligibility. Working on the `Help on Demand` contract to provide consumers on-demand support from agents and brokers to purchase Quality Health Plans (QHPs)."
                )
              ),
              tags$div(
                class = "entry-card",
                tags$p(
                  tags$strong(
                    "Statistics Trainee"
                  )
                ),
                tags$p(
                  "United States Department of Agriculture National Agricultural Statistics Service (USDA NASS) | Great Lakes Region"
                ),
                tags$p(
                  "04/2022 - 08/2022 | East Lansing, MI"
                ),
                tags$p(
                  "Edited, analyzed, and cleaned over 600 records from USDA NASS questionnaires such as the June Area survey, crop weather reports, and cash rents data, and worked on the publication of National Agricultural Reports in the Great Lakes Region, including survey data cleaning and data visualization."
                )
              )
            ),
            tags$div(
              class = "subpage",
              id = "sub-teaching",
              tags$div(
                class = "entry-card",
                tags$p(
                  tags$strong(
                    "Graduate Student Instructor"
                  )
                ),
                tags$p(
                  "University of Michigan College of Literature, Science, and the Arts"
                ),
                tags$p(
                  "08/2023 - 01/2025 | Ann Arbor, MI"
                ),
                tags$p(
                  "Graduate Student Instructor for SOC 210: Introduction to Statistics for the Social Sciences. I taught 13-40 undergraduate students at the University of Michigan per week for three semesters on introductory statistical concepts and their applications into social science research. Students' experience level of statistics ranged from no exposure to university-level coursework completed. I was tasked with bridging this wide range in quantitative skill levels to support and allow each student succeed."
                )
              )
            ),
            tags$div(
              class = "subpage",
              id = "sub-research",
              tags$div(
                class = "entry-card",
                tags$p(
                  tags$strong(
                    "Research Assistant"
                  )
                ),
                tags$p(
                  "University of Michigan Institute for Social Research | Survey Research Center | Social Environment and Health Program"
                ),
                tags$p(
                  "07/2024 - 01/2026 | Ann Arbor, MI"
                ),
                tags$p(
                  "Working with Dr. Kate Duchowny on descriptive characterization of the National Neighborhood Data Archive (NaNDA)'s Essential Workers dataset. These datasets are derived from the American Community Survey and provide insights into how built environment impacts the health of its residents. My research involves understanding where essential workers live and visualizing their distribution across the United States."
                )
              ),
              tags$div(
                class = "entry-card",
                tags$p(
                  tags$strong(
                    "Research Assistant"
                  )
                ),
                tags$p(
                  "University of Michigan School of Public Health | Department of Health Management and Policy"
                ),
                tags$p(
                  "05/2024 - 12/2024 | Ann Arbor, MI"
                ),
                tags$p(
                  "Individually guided epidemiological research with Dr. Rahul Ladhania on a health application,",
                  tags$em(
                    "fooya!"
                  ),
                  "geared towards children to mitigate diabetes onset using a digital health intervention."
                )
              ),
              tags$div(
                class = "entry-card",
                tags$p(
                  tags$strong(
                    "Program Assistant"
                  )
                ),
                tags$p(
                  "University of Michigan LEAD Scholars Research Program"
                ),
                tags$p(
                  "06/2024 - 07/2024 | Ann Arbor, MI"
                ),
                tags$p(
                  "Program Assistant for the University of Michigan LEAD Scholars Research Program, supporting undergraduate researchers in the program under Dr. Rahul Ladhania."
                )
              ),
              tags$div(
                class = "entry-card",
                tags$p(
                  tags$strong(
                    "Undergraduate Research Assistant, Ono Lab"
                  )
                ),
                tags$p(
                  "University of Michigan Medical School | Department of Microbiology and Immunology"
                ),
                tags$p(
                  "04/2020 - 08/2023 | Ann Arbor, MI"
                ),
                tags$p(
                  "Researched HIV-1 infection processes under Dr. Akira Ono, with an emphasis on molecular mechanisms impacting viral infectivity. Utilized wet laboratory and computational methods to identify proteins and genes of interest and perform analyze using live cancer cell lines."
                )
              ),
              tags$div(
                class = "entry-card",
                tags$p(
                  tags$strong(
                    "Research Assistant"
                  )
                ),
                tags$p(
                  "University of Michigan Department of Women and Gender Studies"
                ),
                tags$p(
                  "05/2022 - 12/2022 | Ann Arbor, MI"
                ),
                tags$p(
                  "Under Dr. Diana Louis, examined primary source narratives to identify mental health experiences among freed and incarcerated Black individuals in the mid to late-19th century using qualitative thematic methods."
                )
              ),
              tags$div(
                class = "entry-card",
                tags$p(
                  tags$strong(
                    "Undergraduate Research Assistant, Galban Lab"
                  )
                ),
                tags$p(
                  "University of Michigan Undergraduate Research Opportunity Program (UROP)"
                ),
                tags$p(
                  "09/2020 - 05/2021 | Ann Arbor, MI"
                ),
                tags$p(
                  "Contributed to a mouse model research data pool by collecting and organizing information from Excel RNASeq data. Presented research conclusions at the University of Michigan's year-end research symposium."
                )
              )
            ),
            tags$div(
              class = "subpage",
              id = "sub-practice",
              tags$div(
                class = "entry-card",
                tags$p(
                  tags$strong(
                    "Student Consultant"
                  )
                ),
                tags$p(
                  "Ginsberg Center for Community Service and Learning | Community Technical Assistance Collaborative"
                ),
                tags$p(
                  "05/2023 - 01/2025 | Ann Arbor, MI"
                ),
                tags$p(
                  "Project consultant with specialization in data-based technical assistance methods."
                ),
                tags$p(
                  "Notable Projects:"
                ),
                tags$ol(
                  tags$li(
                    "Performed ordinance analysis of Ypsilanti Twp, Pittsfield Twp, and the City of Ann Arbor regulations surrounding residential and property violations leading to fines or other punitive damages for residents using a qualitative approach."
                  ),
                  tags$li(
                    "Developed an improved data mapping tool using RShiny and ShinyApps to support efforts to create a website application that visualizes and highlights the prevalence of manufactured housing communities in the state of Michigan. Access here:",
                    tags$a(
                      href = "https://vwang.shinyapps.io/mhcR/",
                      target = "_blank",
                      rel = "noopener",
                      "https://vwang.shinyapps.io/mhcR/"
                    )
                  ),
                  tags$li(
                    "Explained insights into reform recommendations surrounding existing restraint laws, contributing to the establishment of the Juvenile Justice Reform Task Force, formed by Governor Whitmer and led by Lt. Governor Gilchrist to address questions relating to juvenile justice reform. Translated complex restraint and seclusion incidence data insights into actionable strategies, presenting data evaluation findings and policy recommendations to the Michigan Department of Health and Human Services in July 2023."
                  )
                )
              ),
              tags$div(
                class = "entry-card",
                tags$p(
                  tags$strong(
                    "PHAST Fellow"
                  )
                ),
                tags$p(
                  "Public Health Action Support Team"
                ),
                tags$p(
                  "03/2024 - 05/2024 | San Antonio, TX"
                ),
                tags$p(
                  "In partnership with the South Central Texas Area Health Education Centers, I was deployed to San Antonio, Texas to collect data, analyze, and perform a community literacy and awareness assessment for asthma literacy in West San Antonio and presented findings to an interdisciplinary team featuring hospital administrators, community health workers and members, and state officials."
                )
              ),
              tags$div(
                class = "entry-card",
                tags$p(
                  tags$strong(
                    "Intern"
                  )
                ),
                tags$p(
                  "Child Care Network"
                ),
                tags$p(
                  "10/2022 - 12/2022 | Ann Arbor, MI"
                ),
                tags$p(
                  "Research intern examining children's health outcomes and early childhood literacy with a focus on functional health literacy that informs personalized health decisions."
                )
              )
            ),
            tags$div(
              class = "subpage",
              id = "sub-fun",
              tags$div(
                class = "entry-card",
                tags$p(
                  tags$strong(
                    "Studio Experience Team"
                  )
                ),
                tags$p(
                  "CorePower Yoga"
                ),
                tags$p(
                  "01/2026 - 06/2026 | Washington, DC"
                )
              ),
              tags$div(
                class = "entry-card",
                tags$p(
                  tags$strong(
                    "Circulation Services Assistant"
                  )
                ),
                tags$p(
                  "University of Michigan"
                ),
                tags$p(
                  "08/2021 - 01/2025 | Ann Arbor, MI"
                )
              ),
              tags$div(
                class = "entry-card",
                tags$p(
                  tags$strong(
                    "Social Media Ambassador"
                  )
                ),
                tags$p(
                  "Flytedesk"
                ),
                tags$p(
                  "09/2020 - 12/2024"
                ),
                tags$p(
                  "Developed engaging Instagram Stories and Posts focused on voter education, deadlines, registration steps, and voting rights. Planned and executed targeted social media campaigns leading up to key voting dates."
                )
              )
            )
          )
        ),
        tags$section(
          class = "page",
          id = "projects",
          tags$div(
            class = "entry-card",
            tags$h3(
              "Community Partners Map"
            ),
            tags$p(
              tags$em(
                "Ginsberg Center for Community Service and Learning"
              )
            ),
            tags$p(
              "An interactive map of the Ginsberg Center's community partner organizations, built and hosted on Posit Connect Cloud."
            ),
            tags$div(
              tags$a(
                class = "btn btn-primary",
                href = "https://viwack-ginsberg-community-partners.share.connect.posit.cloud/",
                target = "_blank",
                rel = "noopener",
                "Open Community Partners Map in a new tab"
              )
            )
          ),
          tags$div(
            class = "entry-card",
            tags$h3(
              "IMPACT Medicare Advantage Cancer Centers"
            ),
            tags$p(
              tags$em(
                "Graduate Student Researcher Academic Appointment"
              )
            ),
            tags$p(
              "Evaluating the distribution of NCI-accredited Cancer Centers and their coverage by Medicare Advantage plans, as part of my graduate student researcher appointment at the University of Pittsburgh School of Public Health."
            )
          ),
          tags$div(
            class = "entry-card",
            tags$h3(
              "Empowering Advocacy through Data: Mapping Manufactured Housing Communities with MHAction and CTAC"
            ),
            tags$p(
              tags$em(
                "The Project"
              )
            ),
            tags$p(
              "In collaboration with",
              tags$strong(
                "MHAction"
              ),
              ", Ginsberg's Community Technical Assistance Collaborative (CTAC) developed an innovative web-based mapping application that visualizes",
              tags$strong(
                "manufactured housing communities (MHCs)"
              ),
              "across Michigan. The project aim was to create an accessible tool that could assist in the organization’s advocacy for affordable and quality manufactured housing, and to bolster their broader campaigns for racial and economic justice."
            ),
            tags$p(
              tags$em(
                "What We Created"
              )
            ),
            tags$p(
              "Under this partnership, we designed and coded an interactive mapping web tool, accompanied by a comprehensive data use guide. The tool visualizes data on MHCs, allowing users to zoom in on specific legislative districts, explore detailed community information, and generate site data in table form. Built on the RShiny framework, the tool integrates data sources from the Michigan Department of Licensing and Regulatory Affairs (LARA) and MHVillage, ensuring data is both accurate and up-to-date. The guide provides step-by-step instructions for using the tool, including data updates and running the application locally."
            ),
            tags$div(
              tags$a(
                class = "btn btn-primary",
                href = "https://mhaction-mi-map.share.connect.posit.cloud/",
                target = "_blank",
                rel = "noopener",
                "Manufactured Housing Mapping Dashboard, MHAction"
              )
            ),
            tags$br(),
            tags$img(
              src = "img/mhaction.webp",
              height = "300",
              style = "height:300px;width:auto;max-width:100%",
              loading = "lazy",
              alt = "MHAction mapping dashboard screenshot"
            ),
            tags$br()
          ),
          tags$div(
            class = "entry-card",
            tags$h3(
              "Ann Arbor Summer Festival"
            ),
            tags$p(
              tags$em(
                "This report outlines the processes and findings from a visitor survey conducted at the Ann Arbor Summer Festival (A2SF) in 2024. The survey aimed to gather demographic and experiential data from festival attendees to help A2SF better understand and serve its audience."
              )
            ),
            tags$p(
              tags$strong(
                "Project Timeline:"
              )
            ),
            tags$p(
              "January - April 2024: CTAC student team collaborated with A2SF to design the survey and dissemination plan for the summer season."
            ),
            tags$p(
              "June 14 - 30, 2024: In-person data collection was supported by CTAC students, except for specific dates when the festival was not operating."
            ),
            tags$p(
              "August - September 2024: Combined and analyzed in-person and postseason survey data after extensive cleaning."
            ),
            tags$div(
              tags$a(
                class = "btn btn-primary",
                href = "https://viwack.github.io/a2sf-visitor-survey/",
                target = "_blank",
                rel = "noopener",
                "Ann Arbor Summer Festival Visitor Survey 2024 Report"
              )
            ),
            tags$img(
              src = "img/a2sf.webp",
              style = "height:400px;width:auto;max-width:100%",
              loading = "lazy",
              alt = "Ann Arbor Summer Festival survey report"
            )
          )
        ),
        tags$section(
          class = "page",
          id = "publications",
          tags$div(
            class = "content-box",
            tags$h3(
              "Publications"
            ),
            tags$article(
              class = "pub-card",
              tags$img(
                class = "pub-thumb",
                src = "https://journals.plos.org/plosone/article/figure/image?size=medium&id=10.1371/journal.pone.0357792.g002",
                alt = "Heatmap of neighborhood resources by essential worker quintile",
                loading = "lazy"
              ),
              tags$div(
                class = "pub-body",
                tags$h4(
                  class = "pub-title",
                  tags$a(
                    href = "https://journals.plos.org/plosone/article?id=10.1371/journal.pone.0357792",
                    target = "_blank",
                    rel = "noopener",
                    "Essential work, unequal places: Neighborhood characteristics of the essential workforce in the United States during the COVID-19 pandemic"
                  )
                ),
                tags$p(
                  class = "pub-authors",
                  "Kate Duchowny,",
                  tags$strong(
                    "Vicky Wang"
                  ),
                  ", Grace Noppert, Robert Melendez, Lindsay Gypin, Philippa Clarke"
                ),
                tags$p(
                  class = "pub-venue",
                  tags$em(
                    "PLOS ONE"
                  ),
                  "21(9): e0357792 \u00b7 September 30, 2026"
                ),
                tags$p(
                  class = "pub-desc",
                  "Links National Neighborhood Data Archive (NaNDA) data with American Community Survey estimates to describe where U.S. essential workers lived at the start of the COVID-19 pandemic. Neighborhoods with more essential workers had better access to food stores, but far less access to health care and parks and green space."
                ),
                tags$a(
                  class = "btn btn-primary",
                  href = "https://journals.plos.org/plosone/article?id=10.1371/journal.pone.0357792",
                  target = "_blank",
                  rel = "noopener",
                  "Read the paper"
                )
              )
            )
          )
        ),
        tags$section(
          class = "page",
          id = "cv",
          tags$div(
            class = "content-box",
            tags$h3(
              "Curriculum Vitae"
            ),
            tags$div(
              class = "cv-actions",
              tags$a(
                class = "btn btn-primary",
                href = "Vicky-Wang-CV.pdf",
                download = "",
                "Download CV (PDF)"
              ),
              tags$a(
                class = "btn btn-primary",
                href = "Vicky-Wang-CV.pdf",
                target = "_blank",
                rel = "noopener",
                "Open in new tab"
              )
            ),
            tags$iframe(
              class = "cv-frame",
              src = "Vicky-Wang-CV.pdf#view=FitH",
              title = "Vicky Wang CV"
            ),
            tags$p(
              class = "cv-note",
              "Your browser may not display PDFs inline. Use the buttons above to open or download the CV."
            )
          )
        )
      )
    ),
    tags$footer(
      class = "site-footer",
      tags$span(
        "\u00a9 Vicky Wang"
      )
    ),
    tags$script(
      HTML(
        "\n",
        "(function(){\n",
        "  var pages=[\"about\",\"experience\",\"projects\",\"publications\",\"cv\"], subs=[\"professional\",\"teaching\",\"research\",\"practice\",\"fun\"];\n",
        "  var $=function(s){return document.querySelectorAll(s)};\n",
        "  function route(){\n",
        "    var h=location.hash.replace(\"#\",\"\").split(\"/\"), p=pages.indexOf(h[0])>-1?h[0]:\"about\";\n",
        "    var s=subs.indexOf(h[1])>-1?h[1]:\"professional\";\n",
        "    $(\".page\").forEach(function(e){e.classList.toggle(\"active\",e.id===p)});\n",
        "    $(\"#mainnav li\").forEach(function(e){e.classList.toggle(\"active\",e.dataset.tab===p)});\n",
        "    $(\".subpage\").forEach(function(e){e.classList.toggle(\"active\",e.id===\"sub-\"+s)});\n",
        "    $(\"#subnav li\").forEach(function(e){e.classList.toggle(\"active\",e.dataset.sub===s)});\n",
        "    document.getElementById(\"mainnav\").classList.remove(\"open\");\n",
        "    window.scrollTo(0,0);\n",
        "  }\n",
        "  window.addEventListener(\"hashchange\",route);\n",
        "  document.querySelector(\".navbar-toggle\").addEventListener(\"click\",function(){\n",
        "    var n=document.getElementById(\"mainnav\"); this.setAttribute(\"aria-expanded\",n.classList.toggle(\"open\"));\n",
        "  });\n",
        "  route();\n",
        "})();\n"
      )
    )
  )
)

server <- function(input, output, session) {}

shinyApp(ui, server)