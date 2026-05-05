import Foundation

let hungaryNeighbourhood: [String: Set<String>] = [
    "Baranya": ["Somogy", "Tolna", "Bács-Kiskun"],

    "Bács-Kiskun": ["Baranya", "Tolna", "Fejér", "Pest", "Jász-Nagykun-Szolnok", "Csongrád-Csanád"],

    "Békés": ["Jász-Nagykun-Szolnok", "Csongrád-Csanád", "Hajdú-Bihar"],

    "Borsod-Abaúj-Zemplén": [
        "Nógrád",
        "Heves",
        "Jász-Nagykun-Szolnok",
        "Hajdú-Bihar",
        "Szabolcs-Szatmár-Bereg"
    ],

    "Csongrád-Csanád": [
        "Bács-Kiskun",
        "Jász-Nagykun-Szolnok",
        "Békés"
    ],

    "Fejér": [
        "Komárom-Esztergom",
        "Pest",
        "Bács-Kiskun",
        "Tolna",
        "Veszprém"
    ],

    "Győr-Moson-Sopron": [
        "Komárom-Esztergom",
        "Veszprém",
        "Vas"
    ],

    "Hajdú-Bihar": [
        "Szabolcs-Szatmár-Bereg",
        "Borsod-Abaúj-Zemplén",
        "Jász-Nagykun-Szolnok",
        "Békés"
    ],

    "Heves": [
        "Nógrád",
        "Pest",
        "Jász-Nagykun-Szolnok",
        "Borsod-Abaúj-Zemplén"
    ],

    "Jász-Nagykun-Szolnok": [
        "Pest",
        "Heves",
        "Borsod-Abaúj-Zemplén",
        "Hajdú-Bihar",
        "Békés",
        "Csongrád-Csanád",
        "Bács-Kiskun"
    ],

    "Komárom-Esztergom": [
        "Győr-Moson-Sopron",
        "Pest",
        "Fejér",
        "Veszprém"
    ],

    "Nógrád": [
        "Pest",
        "Heves",
        "Borsod-Abaúj-Zemplén"
    ],

    "Pest": [
        "Nógrád",
        "Heves",
        "Jász-Nagykun-Szolnok",
        "Bács-Kiskun",
        "Fejér",
        "Komárom-Esztergom",
        "Borsod-Abaúj-Zemplén"
    ],

    "Somogy": [
        "Vas",
        "Veszprém",
        "Fejér",
        "Tolna",
        "Baranya",
        "Zala"
    ],

    "Szabolcs-Szatmár-Bereg": [
        "Borsod-Abaúj-Zemplén",
        "Hajdú-Bihar"
    ],

    "Tolna": [
        "Fejér",
        "Veszprém",
        "Somogy",
        "Baranya",
        "Bács-Kiskun"
    ],

    "Vas": [
        "Győr-Moson-Sopron",
        "Veszprém",
        "Zala"
    ],

    "Veszprém": [
        "Győr-Moson-Sopron",
        "Komárom-Esztergom",
        "Fejér",
        "Tolna",
        "Somogy",
        "Zala"
    ],

    "Zala": [
        "Vas",
        "Veszprém",
        "Somogy"
    ],

    "Budapest": [
        "Pest"
    ]
]
