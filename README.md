# LemonwayRuby

Attention ! Lemonway API n'accepte que les requêtes provenant d'ip ipv4. Si votre système (comme chez moi) envoie les requêtes via votre ipv6 Lemonway vous retournera un obscure "403 Forbidden". Comme ils ne supportent pas les ipv6, il vous faudra forcer votre machine à l'ipv4. Sur mon mac j'ai appliqué la commande suivante : 

`networksetup -setv6off Wi-Fi`

Pour info, les url d'accès aux api ont la tête suivante : 

Environnement Sandbox :

### Pour l'API Rest : 

Url d'authentification : "https://sandbox-api.lemonway.fr/oauth/api/v1/oauth/token"

Url api : "https://sandbox-api.lemonway.fr/mb/[NOM CLIENT LEMONWAY]/dev/directkitrest/v2/"

Url webkit : "https://sandbox-webkit.lemonway.fr/[NOM CLIENT LEMONWAY]/dev"

### Pour l'API Soap : 

soap_xml_ns : "Service_mb_xml",

soap_username : [Votre identifiant Lemonway en tant qu'utilisateur, probablement votre email]

soap_password : [Votre mot de passe Lemonway en tant qu'utilisateur, celui que vous utilisez pour vous connecter à leur plateforme]

soap_client_id : [NOM CLIENT LEMONWAY],

soap_xml_endpoint : "directkitxml"

### Lien vers les cartes de test pour les paiements CB : 

https://documentation.lemonway.com/reference/cbtestcards
https://documentation.lemonway.com/reference/mastercardtestcards
https://documentation.lemonway.com/reference/visatestcards

### Liste des status Lemonway pour les MoneyIns : 

    0: Success
    3: Lemonway Error
    4: Pending
    6: PSP error
    7: Cancelled
    16: Validation pending

## WARNING

- ATTENTION, les paiements par carte de plus de 250€ sont refusés. L'erreur Lemonway n'est pas explicite du tout (code 100 - "daily, monthly, yearly limits reached")
