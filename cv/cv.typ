// CV - Seonggyun Kim
#set document(title: "CV - Seonggyun Kim", author: "Seonggyun Kim")
#set page(paper: "a4", margin: 1.5cm)
#set text(font: "Liberation Serif", size: 10.5pt)
#set par(justify: true)
#show link: it => underline(text(fill: rgb("#1F224A"), it))

// Chemical formula helper (like \ce in LaTeX)
#let ce(formula) = {
  show regex("\d+"): it => sub(it)
  formula
}

// Project entry helper (keeps entry together on one page)
#let project(title, link-url, date, bullets) = block(breakable: false)[
  *#title* #link(link-url)[*(link)*] #h(1fr) *#date*
  #for bullet in bullets [
    - #bullet
  ]
]

// --- HEADER ---
#align(center)[
  #text(size: 20pt, weight: "bold")[Seonggyun Kim]
  #v(-1.5em) #line(length: 100%, stroke: 0.5pt) #v(-1em)
  #link("mailto:seonggyun.kim@outlook.com")[seonggyun.kim\@outlook.com]
  | +82#h(0.16em)10#h(0.16em)4142#h(0.16em)0178
  | Seoul, South Korea
  | #link("https://www.linkedin.com/in/seonggyunkim")[www.linkedin.com/in/seonggyunkim]
  | #link("https://kmsnggyn.github.io")[view online]
]

// --- SUMMARY ---
#text(weight: "bold")[SUMMARY]
#v(-1em) #line(length: 100%, stroke: 0.5pt) #v(-0.5em)
Chemical engineering graduate passionate about industry decarbonization and sustainable energy solutions. Experienced in process simulation, numerical modelling, and techno-economic analysis, with hands-on research expertise in carbon capture processes and hydrogen economy. Strong background in process optimization, energy storage, and industrial-scale applications of low-carbon technologies.

// --- EDUCATION ---
#v(1em)
#text(weight: "bold")[EDUCATION]
#v(-1em) #line(length: 100%, stroke: 0.5pt) #v(-0.5em)

*KTH Royal Institute of Technology* #h(1fr) *Dec. 2025* \
_M.Sc., Chemical Engineering for Energy and Environment_ #h(1fr) _Stockholm, Sweden_
- Thesis: Dynamic reactor modeling and operational optimization of flexible e-methanol production.
- Fields of interest: Industrial energy processes, combined heat and power, process modelling and optimization, energy storage and conversion, industry decarbonization, carbon capture, and utilization.

*Hanyang University* #h(1fr) *Feb. 2023* \
_B.S., Chemical Engineering_ #h(1fr) _Seoul, South Korea_
- Thesis: Simulation and optimization of MDEA-based #ce[CO2] capture process using Aspen HYSYS.
- Fields of interest: Thermodynamics, Reaction engineering, Process optimization.

*Nanyang Technological University* #h(1fr) *Jul. 2018* \
_Summer Exchange Program_ #h(1fr) _Singapore_
- Completed "Introduction to Energy" course.

#v(1em)

// --- WORK EXPERIENCE ---
#text(weight: "bold")[WORK EXPERIENCE]
#v(-1em) #line(length: 100%, stroke: 0.5pt) #v(-0.5em)

*AVEVA* #h(1fr) *Sep. 2024 – Nov. 2024* \
_Process Simulation Intern | Solver/Thermo Team, R&D Aveva Process Simulation_ #h(1fr) _Lake Forest, California (Remote)_
- Expanded the thermodynamic database for AVEVA Process Simulation, enhancing industry adoption of advanced carbon capture technologies (Benfield process, AMP-PZ solvent).
  - Developed electrolyte-NRTL fluid/reaction models for #ce[K2CO3]-#ce[CO2]-#ce[H2O] and AMP-PZ-#ce[CO2]-#ce[H2O] systems.
  - Conducted thermophysical property regression using Python scripts to align with experimental data.
- Built process simulation files for headless testing and prepared technical documents on carbon capture processes.

*Fraunhofer UMSICHT* #h(1fr) *Sep. 2022 – Feb. 2023* \
_Research Assistant | Department of Low Carbon Technologies_ #h(1fr) _Oberhausen, Germany_
- "Ammonia to Hydrogen" project: a system-level analysis of ammonia decomposition process for hydrogen production.
  - Designed and optimized an Aspen PLUS process simulation for ammonia-to-hydrogen scenarios with techno-economic evaluation.
  - Assembled and tested an electrically heated fixed-bed reactor for ammonia decomposition, optimizing temperature profiles based on activated carbon packing.

#v(1em)

// --- ACADEMIC PROJECTS ---
#text(weight: "bold")[ACADEMIC PROJECTS]
#link("https://www.seonggyun.kim/projects.html")[*(link)*]
#v(-0.75em) #line(length: 100%, stroke: 0.5pt) #v(-0.5em)

#project(
  "Dynamic Reactor Modeling and Operational Optimization of Flexible E-Methanol Production",
  "https://www.seonggyun.kim/projects/msc-thesis-seonggyun-kim.pdf",
  "Dec. 2025",
  (
    "Built steady-state process model and dynamic reactor model in Aspen Dynamics for Power-to-Methanol process.",
    "Developed MILP optimization framework integrating dynamic constraints to determine optimal operating schedules against Swedish electricity prices (2019–2023).",
    "Achieved cost reductions up to 24.5% through flexibility-aware scheduling during high price volatility periods.",
  )
)

#project(
  "Techno-economic Analysis of CCUS in Sweden",
  "https://www.seonggyun.kim/projects/techno-economic-analysis-ccus-sweden.pdf",
  "Dec. 2024",
  (
    [Modeled MEA-based carbon capture and #ce[CO2] hydrogenation processes using Aspen Plus V14.],
    "Evaluated economic feasibility for storage and utilization scenarios in Sweden's cement (Slite) and pulp (Korsnäs) industries.",
    "Led methanol production process design, optimizing kinetic models and reporting levelized costs for breakeven analysis.",
  )
)

#project(
  "AVEVA Process Simulation Academic Competition 2024 - Hydrogen Economy",
  "https://www.seonggyun.kim/projects/aps-competition-submission-seonggyun-kim.pdf",
  "Feb. 2024",
  (
    "Designed a green ammonia synthesis process integrating solar hydrogen production in AVEVA Process Simulation.",
    "Optimized heat integration using high- and low-pressure steam, comparing EAOC and NPV against pipeline transport.",
    "The simulation and technical report entries in the three-part project won \"Best Overall\" prize in Europe.",
  )
)

#project(
  [Metal Recovery Using Supercritical #ce[CO2]],
  "https://www.seonggyun.kim/projects/metal-recovery-supercritical-co2.pdf",
  "Feb. 2024",
  (
    [Investigated sc#ce[CO2] extraction for recovering rare earth elements and heavy metals from coal fly ash, ores, and batteries.],
    "Demonstrated industrial potential with recovery rates up to 97% for uranium and 90% for rare earth elements.",
    "Assessed the technology readiness level (TRL 4) and selectivity challenges for industrial implementation.",
  )
)

#project(
  "Nickel-rich Electrodes for Li-ion Batteries",
  "https://www.seonggyun.kim/projects/nickel-rich-electrodes-li-ion-batteries.pdf",
  "Dec. 2023",
  (
    "Reviewed Ni-rich electrodes for lithium-ion batteries, highlighting their structural configurations, degradation mechanisms, and commercial applications.",
    "Identified performance limitations and degradation during cycling, and challenges in finding suitable electrolytes.",
    "Addressed the need to replace cobalt in existing electrodes and the overall impact on the commercial viability of Ni-rich materials.",
  )
)

#project(
  "Pressurized Pilot-scale Fluidized Bed Gasifier: A Risk Analysis",
  "https://www.seonggyun.kim/projects/pressurized-fluidized-bed-gasifier-risk-analysis.pdf",
  "Dec. 2023",
  (
    "Conducted a Preliminary Hazard Analysis (PHA) and What-if analysis on an existing gasification plant at KTH.",
    "Provided risk assessments and recommendations for process safety enhancements.",
  )
)

#project(
  "Thermodynamic Analysis of a Biomass-fueled Combined Heat and Power Plant with a Fuel Drier",
  "https://www.seonggyun.kim/projects/biomass-fired-chp-plant-with-fuel-drier.pdf",
  "Oct. 2023",
  (
    "Thermodynamic analysis of the system components (compressors, turbines, heat exchangers, and a drier).",
    "Presented graphical results from pinch analysis and heat exchange calculations.",
    "Economic analysis based on different scenarios varying electricity, fuel, and green certificate prices.",
  )
)

#project(
  [Simulation and Optimization of MDEA-based #ce[CO2] Capture Process],
  "https://www.seonggyun.kim/projects/simulation-optimization-mdea-carbon-capture.pdf",
  "Jun. 2022",
  (
    "Developed Aspen HYSYS simulations for process optimization and sensitivity analysis.",
    [Verified the relationship between absorber L/G ratio, #ce[CO2] recovery, lean loading, and specific reboiler duty.],
  )
)

#project(
  "NRTL Parameter Optimization for Alkane/Sulfolane Binary Mixtures",
  "https://www.seonggyun.kim/projects/nrtl-parameter-optimization-alkane-sulfolane.pdf",
  "Nov. 2021",
  (
    "Optimized NRTL parameters to accurately calculate liquid-liquid equilibria using MATLAB.",
    "Achieved improved accuracy by adding a linear term to the τ term in the conventional model.",
  )
)

#project(
  "Estimation of Energy Penalty in Post-Combustion CCS",
  "https://www.seonggyun.kim/projects/co2-compression-refrigeration-ccs-energy-penalty.pdf",
  "Jun. 2021",
  (
    [Estimated energy consumption of #ce[CO2] compression and refrigeration using Lee-Kesler equation of state programmed in MATLAB.],
    "Optimized compression processes for high-pressure storage and low-pressure transport pathways.",
  )
)

#project(
  "Eigenfaces: Face Recognition Machine Learning Algorithm",
  "https://www.seonggyun.kim/projects/eigenfaces-kim-seonggyun.pdf",
  "Dec. 2020",
  (
    "Developed a face recognition machine learning algorithm in MATLAB using PCA and SVD.",
    "Trained on Yale_B dataset and successfully identified faces outside the training set.",
    "Applied dimensionality reduction and pattern recognition techniques for real-world image data.",
  )
)

// --- COMPUTER SKILLS ---
#v(1em)
#text(weight: "bold")[COMPUTER SKILLS]
#v(-1em) #line(length: 100%, stroke: 0.5pt) #v(-0.5em)

*Programming:* MATLAB, Python, Fortran, MS Excel VBA (Intermediate level); MS Visual C++, C (Basic level) \
*Application:* AVEVA Process Simulation, Aspen HYSYS, Aspen PLUS, COMSOL; MS Office

// --- LANGUAGES ---
#v(1em)
#text(weight: "bold")[LANGUAGES]
#v(-1em) #line(length: 100%, stroke: 0.5pt) #v(-0.5em)

- Korean: Native
- English: Proficient
- Swedish: Beginner

// --- OTHER ---
#v(1em)
#text(weight: "bold")[OTHER]
#v(-1em) #line(length: 100%, stroke: 0.5pt) #v(-0.5em)

- Hobbies: Jazz performance/composition, Linux ricing
