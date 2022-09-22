<div align="justify">
<a id="read-me"></a>
<br />

<!-- title -->
<div align="center">
<pre><h3>~/.</h3>
<p>Keep calm and dotfiles</p></pre>
</div>

<!-- table-of-contents -->
<details>
  <summary>Table of Contents</summary>
  <ol>
    <li>
      <a href="#introduction">Introduction</a>
    </li>
    <li>
      <a href="#getting-started">Getting Started</a>
      <ul>
        <li><a href="#prerequisites">Prerequisites</a></li>
        <li><a href="#installation">Installation</a></li>
      </ul>
    </li>
    <li><a href="#usage">Usage</a></li>
    <li><a href="#contents">Contents</a></li>
    <li><a href="#license">License</a></li>
  </ol>
</details>

<!-- intro -->
## Introduction

This library contains scripts, utilities and configurations targeting *macOS* environments. Your needs may be different, feel free to adjust accordingly.

<!-- get-started -->
## Getting started

Before you get started, make sure you check the requirements. 

### Prerequisites

On a mature environment:
* Don't forget to backup your files.

### Installation

On a clean OS setting, use a script
```sh
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/implete/dotfiles/main/bin/bootstrap)"
```

Otherwise simply clone the repository
```sh
git clone https://github.com/implete/dotfiles
```

<!-- usage -->
## Usage

1. Check out the `.env` file if you'd like to change the default path or settings.
2. Run
```sh
# Replace SCRIPT_NAME with the name of the script
$HOME/Developer/dotfiles/bin/SCRIPT_NAME
```

<!-- contents -->
## Contents

* *bin/* contains executable scripts 
  - *bootstrap* for downloading and installing dotfiles
  - *setup* for installing dotfiles
* *git/* contains the symlinked .git files
* *lib/* contains helper scripts
* *macos/* contains system setup files
* *private/* kept on a private repository, contains custom settings, for example a `.gitconfig` file with my own username/email included in the symlinked file.


<!-- license -->
## License

The Unlicense. See `UNILICENSE` for more information.

<!-- elevator -->
<div align="center">
<pre><a href="#read-me">BACK TO TOP</a></pre>
</div>

</div>