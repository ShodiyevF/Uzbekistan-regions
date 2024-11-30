import path from 'path'
import fs from 'fs'

const file = fs.readFileSync(path.join(process.cwd(), 'regions.json'))
const datas = JSON.parse(file)

function regionsSql() {
    const values = datas.regions.map(region => `('${region.name}')`).join(',\n');
    return `INSERT INTO regions (region_name) VALUES\n${values};`;
}

function districtsSql() {
    const values = datas.districts.map(district => `('${district.name.replace(/'/g, "''")}', '${district.region_id}')`).join(',\n');
    return `INSERT INTO districts (district_name, region_id) VALUES\n${values};`;
}