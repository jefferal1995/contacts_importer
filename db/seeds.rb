# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Franchise.create([{ name: 'American Express', start_numbers: [34, 37], lengths: [15] },
 { name: 'Bankcard', start_numbers: [5610, 560221, 560222, 560223, 560224, 560225], lengths: [16] },
 { name: 'China T-Union', start_numbers: [31], lengths: [19] },
 { name: 'China UnionPay', start_numbers: [62] , lengths: [16, 17, 18, 19] },
 { name: 'Diners Club International', start_numbers: [36], lengths: [14, 15, 16, 17, 18, 19] },
 { name: 'Diners Club United States & Canada', start_numbers: [54], lengths: [16] },
 { name: 'Discover Card', start_numbers: [6011, 622126, 622925, 644, 645, 646, 647, 648, 649, 65], lengths: [16, 17, 18, 19] },
 { name: 'UkrCard', start_numbers: 	(60400100..60420099).to_a, lengths: [16, 19] },
 { name: 'RuPay', start_numbers: [60, 6521, 6522], lengths: [16] },
 { name: 'InterPayment', start_numbers: [636], lengths: [16, 17, 18, 19] },
 { name: 'InstaPayment', start_numbers: [637, 638, 639]	, lengths: [16] },
 { name: 'JCB', start_numbers: (3528..3589).to_a, lengths: [16, 17, 18, 19] },
 { name: 'Laser', start_numbers: [6304, 6706, 6771, 6709] , lengths: [16, 17, 18, 19] },
 { name: 'Maestro UK', start_numbers: [6759, 676770, 676774] , lengths: [12, 13, 14, 15, 16, 17, 18, 19] },
 { name: 'Maestro', start_numbers: [5018, 5020, 5038, 5893, 6304, 6759, 6761, 6762, 6763], lengths: [12, 13, 14, 15, 16, 17, 18, 19] },
 { name: 'Dankort', start_numbers: 	[5019, 4571], lengths: [16] },
 { name: 'MIR', start_numbers: [2200, 2201, 2202, 2203, 2204], lengths: [16] },
 { name: 'NPS Pridnestrovie', start_numbers: (6054740..6054744).to_a, lengths: [16] },
 { name: 'Mastercard', start_numbers: (2221..2720).to_a + [51, 52, 53, 54], lengths: [16] },
 { name: 'Solo', start_numbers: [6334, 6767], lengths: [16, 18, 19] },
 { name: 'Switch', start_numbers: [4903, 4905, 4911, 4936, 564182, 633110, 6333, 6759], lengths: [16, 18, 19] },
 { name: 'Troy', start_numbers: (979200..979289).to_a, lengths: [16] },
 { name: 'Visa', start_numbers: [4], lengths: [13, 14, 15, 16] },
 { name: 'Visa Electron', start_numbers: [4026, 417500, 4508, 4844, 4913, 4917], lengths: [16] },
 { name: 'UATP', start_numbers: [1], lengths: [15] },
 { name: 'Verve', start_numbers: (506099..506198).to_a + (650002..650027).to_a, lengths: [16, 17, 18, 19]},
 { name: 'LankaPay', start_numbers: [357111], lengths: [16]	 }])
