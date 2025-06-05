/* main.js ──────────────────────────────────────────────────────────── */

// Inject shared navbar and highlight current link
document.addEventListener("DOMContentLoaded", () => {
  fetch("navbar.html")
    .then(r => r.text())
    .then(html => {
      const slot = document.getElementById("navbar-placeholder");
      slot.innerHTML = html;

      const current = location.pathname.split("/").pop() || "index.html";
      slot.querySelectorAll(".nav-link").forEach(a => {
        if (a.getAttribute("href") === current) a.classList.add("active");
      });
    });
});

/* ---------- PDF viewer ---------- */
function viewPDF(path, targetId) {
  const wrap = document.getElementById(targetId);
  wrap.innerHTML = `
    <button class="close-btn" onclick="closeViewer('${targetId}')">Close</button>
    <iframe src="${path}#zoom=page-width"></iframe>`;
}
function closeViewer(id) {
  const wrap = document.getElementById(id);
  if (wrap && wrap._pdfSwitchHtml) {
    wrap.innerHTML = `
      <div class="pdf-viewer-switch-row">
        ${wrap._pdfSwitchHtml}
      </div>
    `;
  } else if (wrap) {
    wrap.innerHTML = "";
  }
}
window.viewPDF = viewPDF;
window.closeViewer = closeViewer;

/* ---------- Expand / collapse rows ---------- */
let viewerSeq = 0;
let expandedRow = null;

function toggleDetails(row) {
  const projectInfo = {
    category: row.dataset.category,
    desc: row.dataset.desc,
    link1Name: row.dataset.link1Name,
    link1: row.dataset.link1Url,
    link2Name: row.dataset.link2Name,
    link2: row.dataset.link2Url,
    img: row.dataset.img // NEW: image path if present
  };

  if (expandedRow && expandedRow !== row) {
    expandedRow.nextElementSibling.remove();
    expandedRow.classList.remove('open');
  }

  if (expandedRow === row) {
    row.nextElementSibling.remove();
    row.classList.remove('open');
    expandedRow = null;
    return;
  }

  const viewerId = `pdf-viewer-${++viewerSeq}`;

  const linkPairs = [];
  if (projectInfo.link1Name && projectInfo.link1) {
    linkPairs.push([projectInfo.link1Name, projectInfo.link1]);
  }
  if (projectInfo.link2Name && projectInfo.link2) {
    linkPairs.push([projectInfo.link2Name, projectInfo.link2]);
  }

  // Build the link buttons row (switchHtml)
  let pdfSwitchHtml = "";
  if (linkPairs.length > 0) {
    pdfSwitchHtml = linkPairs.map(([name, url]) =>
      `<button class="pdf-switch-btn" onclick="viewPDF('${url}','${viewerId}','${name}', window['${viewerId}_switchHtml']);return false;">${name}</button>`
    ).join(' ');
  }

  // NEW: If there is an image, add it above the buttons
  let imageHtml = '';
  if (projectInfo.img) {
    imageHtml = `<div class="project-expanded-img-wrap"><img src="${projectInfo.img}" alt="Project flowsheet image" style="max-width:100%;" /></div>`;
  }

  const details = document.createElement('tr');
  details.className = 'details-row';
  details.innerHTML = `
    <td colspan="2">
      ${projectInfo.category || ''}
      <ul class="project-desc-list">${(projectInfo.desc || '').split('|').map(t => `<li>${t.trim()}</li>`).join('')}</ul>
      ${imageHtml}
      <div id="${viewerId}" class="pdf-wrap">
        <div class="pdf-viewer-switch-row">
          ${pdfSwitchHtml}
        </div>
      </div>
    </td>`;
  row.parentElement.insertBefore(details, row.nextSibling);

  // Store the switchHtml for later use in closeViewer
  const pdfWrap = document.getElementById(viewerId);
  pdfWrap._pdfSwitchHtml = pdfSwitchHtml;
  window[`${viewerId}_switchHtml`] = pdfSwitchHtml;

  row.classList.add('open');
  expandedRow = row;

  // Scroll to row (as before)
  const nav = document.querySelector('nav');
  const navHeight = nav ? nav.offsetHeight : 0;
  const rowRect = row.getBoundingClientRect();
  const absoluteY = window.scrollY + rowRect.top;
  window.scrollTo({
    top: absoluteY - navHeight - 8,
    behavior: "smooth"
  });
}

window.toggleDetails = toggleDetails;

/* ---------- Simple table sorter ---------- */
function sortTable(col) {
  // Collapse any expanded row before sorting
  if (expandedRow) {
    expandedRow.nextElementSibling.remove(); // Remove the details row
    expandedRow.classList.remove('open');    // Remove 'open' class
    expandedRow = null;                      // Reset expandedRow
  }

  const table = document.getElementById("project-table");
  const rows  = Array.from(table.tBodies[0].rows);
  const asc   = !table._asc;                         // toggle direction
  rows.sort((a, b) => {
    const va = a.cells[col].textContent.trim();
    const vb = b.cells[col].textContent.trim();
    return col === 1                                // Year column numeric
      ? (asc ? va - vb : vb - va)
      : (asc ? va.localeCompare(vb) : vb.localeCompare(va));
  });
  rows.forEach(r => table.tBodies[0].appendChild(r));
  table._asc = asc;
}
window.sortTable = sortTable;

/* -------------------------------------------------------------------
   NAVBAR ACTIVE-HIGHLIGHT + TRAVELLING UNDERLINE
------------------------------------------------------------------- */
document.addEventListener("DOMContentLoaded", () => {
  const links = document.querySelectorAll(".nav-link");
  const bar   = document.querySelector(".nav-underline");

  // Helper: position the underline under 'elem'
  function moveBar(elem) {
    const rect = elem.getBoundingClientRect();
    const navRect = elem.parentElement.getBoundingClientRect();
    bar.style.width  = rect.width + "px";
    bar.style.transform = `translateX(${rect.left - navRect.left}px)`;
  }

  // Highlight the current page and set bar position on load
  const current = location.pathname.split("/").pop() || "index.html";
  links.forEach(a => {
    if (a.getAttribute("href") === current) {
      a.classList.add("active");
      moveBar(a);
    }
    // Animate bar when a link is clicked (before navigation happens)
    a.addEventListener("click", e => moveBar(e.currentTarget));
  });

  // Re‑centre on window resize (e.g. mobile rotation)
  window.addEventListener("resize", () => {
    const active = document.querySelector(".nav-link.active");
    if (active) moveBar(active);
  });
});

/* -------------------------------------------------------------------
   IMAGE SCROLLER
------------------------------------------------------------------- */
document.querySelectorAll('.image-scroller').forEach(scroller => {
  scroller.addEventListener('keydown', (e) => {
    if (e.key === 'ArrowRight') {
      scroller.scrollBy({ left: 200, behavior: 'smooth' });
      e.preventDefault();
    } else if (e.key === 'ArrowLeft') {
      scroller.scrollBy({ left: -200, behavior: 'smooth' });
      e.preventDefault();
    }
  });
});

function enlargeImage(anchor) {
  const fullImageSrc = anchor.dataset.full;
  const captionText = anchor.querySelector('img').alt || 'Image'; // Use the alt text as the caption
  const modal = document.createElement('div');
  modal.className = 'image-modal';
  modal.innerHTML = `
    <div class="image-modal-content">
      <img src="${fullImageSrc}" alt="Enlarged Image" style="max-width: 90%; max-height: 90vh; display: block; margin: auto;">
      <div class="image-caption">${captionText}</div>
      <button class="close-btn" onclick="document.body.removeChild(this.parentElement.parentElement)">Close</button>
    </div>
  `;
  modal.onclick = (e) => {
    if (e.target === modal) {
      document.body.removeChild(modal);
    }
  };
  document.body.appendChild(modal);
}

/* -------------------------------------------------------------------
   PAGE DISABLE/ENABLE SYSTEM
------------------------------------------------------------------- */
document.addEventListener("DOMContentLoaded", () => {
  const activePages = ["index.html", "profile.html", "projects.html", "social.html"]; // List of active pages
  const navbar = document.querySelector("nav");
  navbar.querySelectorAll(".nav-link").forEach(link => {
    const href = link.getAttribute("href");
    if (!activePages.includes(href)) {
      link.style.display = "none"; // Hide disabled pages
    }
  });
});