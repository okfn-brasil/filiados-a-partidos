BASE_URL = "http://agencia.tse.jus.br/estatistica/sead/eleitorado/filiados/uf/filiados_{partido}_{uf}.zip"

PARTIDOS = [
  'dem', 'pen', 'pc_do_b', 'pcb',
  'pco', 'pdt', 'phs', 'pmdb',
  'pmn', 'pp', 'ppl', 'pps',
  'pr', 'prb', 'pros', 'prp',
  'prtb', 'psb', 'psc', 'psd',
  'psdb', 'psdc', 'psl', 'psol',
  'pstu', 'pt', 'pt_do_b', 'ptb',
  'ptc', 'ptn', 'pv', 'sdd'
]

ESTADOS = [
  'ac', 'al', 'am', 'ap',
  'ba', 'ce', 'df', 'es',
  'go', 'ma', 'mg', 'ms',
  'mt', 'pa', 'pb', 'pe',
  'pi', 'pr', 'rj', 'rn',
  'ro', 'rr', 'rs', 'sc',
  'se', 'sp', 'to'
]

for partido in PARTIDOS:
    for uf in ESTADOS:
        url = BASE_URL.replace('{partido}', partido).replace('{uf}', uf)
        print url
