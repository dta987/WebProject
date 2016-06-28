$('#bs-docs-sidebar hidden-print hidden-xs hidden-sm affix').affix({
  offset: {
    top: 100,
    bottom: function () {
      return (this.bottom = $('.footer').outerHeight(true))
    }
  }
})