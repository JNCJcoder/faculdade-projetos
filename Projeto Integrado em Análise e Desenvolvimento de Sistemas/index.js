const util = require("util");
const fs = require("fs/promises");

const nunjucks = require("nunjucks");

const nunjucksRender = util.promisify(nunjucks.render);

const DIST_FOLDER =  'dist';
const SRC_FOLDER = 'src';

const pageFile = [
    'index.html',
    'cadastro.html',
    'agenda.html',
    'pacientes.html'
]

nunjucks.configure(SRC_FOLDER);

const render = async (files) =>
{
    try
    {
        const pages = await Promise.all(files.map(file => nunjucksRender(file)));
        
        await Promise.all(pages.map(page => fs.writeFile(`${DIST_FOLDER}/${files.shift()}`, page)));
    }
    catch (error)
    {
        console.log(error);
    }
}

render(pageFile);