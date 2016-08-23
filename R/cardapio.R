#' O que tem pra comer hoje no RU da Unesp Rio Claro?
#'
#' Com o que seremos agraciados neste dia?
#'
#' @import rvest xml2
#' @examples
#' \dontrun{
#' cardapio()
#' }

#' @export
cardapio <- function() {
    page_source <- xml2::read_html(ru_url(), encoding = "iso-8859-1")
    nodes <- rvest::html_nodes(page_source, ".txt_corpo")
    res <- rvest::html_table(nodes)[[1]]
    cat(tolower(res[1, 1]), ":\n", sep = "")
    names(res) <- res[2, ]
    res <- res[-(1:2),]
    data.frame(lapply(res, tolower))
}

ru_url <- function() {
  "http://ib.rc.unesp.br/?xajax=exibeCorpo&xajaxr=1471969920070&xajaxargs[]=587"
}
