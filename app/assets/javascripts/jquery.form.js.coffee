#!
# * jQuery Form Plugin
# * version: 3.24 (26-DEC-2012)
# * @requires jQuery v1.5 or later
# *
# * Examples and documentation at: http://malsup.com/jquery/form/
# * Project repository: https://github.com/malsup/form
# * Dual licensed under the MIT and GPL licenses:
# *    http://malsup.github.com/mit-license.txt
# *    http://malsup.github.com/gpl-license-v2.txt
# 
(($, window) ->
  
  #
  #    Usage Note:
  #    -----------
  #    Do not use both ajaxSubmit and ajaxForm on the same form.  These
  #    functions are mutually exclusive.  Use ajaxSubmit if you want
  #    to bind your own submit handler to the form.  For example,
  #
  #    $(document).ready(function() {
  #        $('#myForm').on('submit', function(e) {
  #            e.preventDefault(); // <-- important
  #            $(this).ajaxSubmit({
  #                target: '#output'
  #            });
  #        });
  #    });
  #
  #    Use ajaxForm when you want the plugin to manage all the event binding
  #    for you.  For example,
  #
  #    $(document).ready(function() {
  #        $('#myForm').ajaxForm({
  #            target: '#output'
  #        });
  #    });
  #    
  #    You can also use ajaxForm with delegation (requires jQuery v1.7+), so the
  #    form does not have to exist when you invoke ajaxForm:
  #
  #    $('#myForm').ajaxForm({
  #        delegation: true,
  #        target: '#output'
  #    });
  #    
  #    When using ajaxForm, the ajaxSubmit function will be invoked for you
  #    at the appropriate time.
  #
  
  ###
  Feature detection
  ###
  
  # helper fn for console logging
  log = ->
    return  unless $.fn.ajaxSubmit.debug
    msg = "[jquery.form] " + Array::join.call(arguments_, "")
    if window.console and window.console.log
      window.console.log msg
    else window.opera.postError msg  if window.opera and window.opera.postError
  
  ###
  ajaxSubmit() provides a mechanism for immediately submitting
  an HTML form using AJAX.
  ###
  #jshint scripturl:true 
  
  # fast fail if nothing selected (http://dev.jquery.com/ticket/2752)
  
  # clean url (don't include hash vaue)
  
  # hook for manipulating the form data before it is extracted;
  # convenient for use with rich editors like tinyMCE or FCKEditor
  
  # provide opportunity to alter form data before it is serialized
  
  # give pre-submit callback an opportunity to abort the submit
  
  # fire vetoable 'validate' event
  # data is null for 'get'
  # data is the query string for 'post'
  
  # perform a load on the target only if dataType is not provided
  # jQuery 1.4+ passes xhr as 3rd arg
  # jQuery 1.4+ supports scope context 
  
  # are there files to upload?
  
  # [value] (issue #113), also see comment:
  # https://github.com/malsup/form/commit/588306aedba1de01388032d5f42a60159eea9228#commitcomment-2180219
  
  # options.iframe allows user to force iframe mode
  # 06-NOV-09: now defaulting to iframe mode if file input is detected
  
  # hack to fix Safari hang (thanks to Tim Molendijk for this)
  # see:  http://groups.google.com/group/jquery-dev/browse_thread/thread/36395b7ab510dd5d
  
  # clear element array
  
  # fire 'notify' event
  
  # utility fn for deep serialization
  
  # #252; undo param space replacement
  
  # XMLHttpRequest Level 2 file uploads (big hat tip to francois2metz)
  
  # workaround because jqXHR does not expose upload property
  #event.position is deprecated
  
  # private function for handling file uploads (hat tip to YAHOO!)
  
  # if there is an input with a name or id of 'submit' then we won't be
  # able to invoke the submit fn on the form (at least not x-browser)
  
  # ensure that every serialized input is still enabled
  # mock object
  # #214, #257
  # abort op in progress
  
  # trigger ajax global events so that activity/block indicators work like normal
  
  # add submitting element to data if we know it
  
  # Rails CSRF hack (thanks to Yvan Barthelemy)
  
  # take a breath so that pending repaints get some cpu time before the upload starts
  
  # make sure form attrs are set
  
  # update form attrs in IE friendly way
  
  # ie borks in some cases when setting encoding
  
  # support timout
  
  # look for server aborts
  
  # add "extra" data to form if provided in options
  
  # if using the $.param format that allows for multiple values with the same name
  
  # add iframe to doc and submit the form
  
  # reset attrs and remove "extra" input elements
  # this lets dom updates render
  
  # response not received yet
  
  # in some browsers (Opera) the iframe DOM is not always traversable when
  # the onload callback fires, so we loop a bit to accommodate
  
  # let this fall through because server response could be an empty document
  #log('Could not access iframe DOM after mutiple tries.');
  #throw 'DOMException: not available';
  
  #log('response detected');
  
  # support for XHR 'status' & 'statusText' emulation :
  
  # see if user embedded response in textarea
  
  # support for XHR 'status' & 'statusText' emulation :
  
  # account for browsers injecting pre around json response
  # we've set xhr.status
  
  # ordering of these callbacks/triggers is odd, but that's how $.ajax does it
  
  # clean up
  # use parseXML if available (jQuery 1.5+)
  #jslint evil:true 
  # mostly lifted from jq1.4.4
  
  ###
  ajaxForm() provides a mechanism for fully automating form submission.
  
  The advantages of using this method instead of ajaxSubmit() are:
  
  1: This method will include coordinates for <input type="image" /> elements (if the element
  is used to submit the form).
  2. This method will include the submit element's name/value data (for the element that was
  used to submit the form).
  3. This method binds the submit() method to the form for you.
  
  The options argument for ajaxForm works exactly as it does for ajaxSubmit.  ajaxForm merely
  passes the options argument along after properly binding events for submit elements and
  the form itself.
  ###
  
  # in jQuery 1.3+ we can fix mistakes with the ready state
  
  # is your DOM ready?  http://docs.jquery.com/Tutorials:Introducing_$(document).ready()
  
  # private event handlers    
  doAjaxSubmit = (e) -> #jshint validthis:true
    options = e.data
    unless e.isDefaultPrevented() # if event has been canceled, don't proceed
      e.preventDefault()
      $(this).ajaxSubmit options
  captureSubmittingElement = (e) -> #jshint validthis:true
    target = e.target
    $el = $(target)
    unless $el.is("[type=submit],[type=image]")
      
      # is this a child element of the submit el?  (ex: a span within a button)
      t = $el.closest("[type=submit]")
      return  if t.length is 0
      target = t[0]
    form = this
    form.clk = target
    if target.type is "image"
      if e.offsetX isnt `undefined`
        form.clk_x = e.offsetX
        form.clk_y = e.offsetY
      else if typeof $.fn.offset is "function"
        offset = $el.offset()
        form.clk_x = e.pageX - offset.left
        form.clk_y = e.pageY - offset.top
      else
        form.clk_x = e.pageX - target.offsetLeft
        form.clk_y = e.pageY - target.offsetTop
    
    # clear form vars
    setTimeout (->
      form.clk = form.clk_x = form.clk_y = null
    ), 100
  "use strict"
  feature = {}
  feature.fileapi = $("<input type='file'/>").get(0).files isnt `undefined`
  feature.formdata = window.FormData isnt `undefined`
  $.fn.ajaxSubmit = (options) ->
    deepSerialize = (extraData) ->
      serialized = $.param(extraData).split("&")
      len = serialized.length
      result = {}
      i = undefined
      part = undefined
      i = 0
      while i < len
        serialized[i] = serialized[i].replace(/\+/g, " ")
        part = serialized[i].split("=")
        result[decodeURIComponent(part[0])] = decodeURIComponent(part[1])
        i++
      result
    fileUploadXhr = (a) ->
      formdata = new FormData()
      i = 0

      while i < a.length
        formdata.append a[i].name, a[i].value
        i++
      if options.extraData
        serializedData = deepSerialize(options.extraData)
        for p of serializedData
          formdata.append p, serializedData[p]  if serializedData.hasOwnProperty(p)
      options.data = null
      s = $.extend(true, {}, $.ajaxSettings, options,
        contentType: false
        processData: false
        cache: false
        type: method or "POST"
      )
      if options.uploadProgress
        s.xhr = ->
          xhr = jQuery.ajaxSettings.xhr()
          if xhr.upload
            xhr.upload.onprogress = (event) ->
              percent = 0
              position = event.loaded or event.position
              total = event.total
              percent = Math.ceil(position / total * 100)  if event.lengthComputable
              options.uploadProgress event, position, total, percent
          xhr
      s.data = null
      beforeSend = s.beforeSend
      s.beforeSend = (xhr, o) ->
        o.data = formdata
        beforeSend.call this, xhr, o  if beforeSend

      $.ajax s
    fileUploadIframe = (a) ->
      getDoc = (frame) ->
        doc = (if frame.contentWindow then frame.contentWindow.document else (if frame.contentDocument then frame.contentDocument else frame.document))
        doc
      doSubmit = ->
        checkState = ->
          try
            state = getDoc(io).readyState
            log "state = " + state
            setTimeout checkState, 50  if state and state.toLowerCase() is "uninitialized"
          catch e
            log "Server abort: ", e, " (", e.name, ")"
            cb SERVER_ABORT
            clearTimeout timeoutHandle  if timeoutHandle
            timeoutHandle = `undefined`
        t = $form.attr("target")
        a = $form.attr("action")
        form.setAttribute "target", id
        form.setAttribute "method", "POST"  unless method
        form.setAttribute "action", s.url  unless a is s.url
        if not s.skipEncodingOverride and (not method or /post/i.test(method))
          $form.attr
            encoding: "multipart/form-data"
            enctype: "multipart/form-data"

        if s.timeout
          timeoutHandle = setTimeout(->
            timedOut = true
            cb CLIENT_TIMEOUT_ABORT
          , s.timeout)
        extraInputs = []
        try
          if s.extraData
            for n of s.extraData
              if s.extraData.hasOwnProperty(n)
                if $.isPlainObject(s.extraData[n]) and s.extraData[n].hasOwnProperty("name") and s.extraData[n].hasOwnProperty("value")
                  extraInputs.push $("<input type=\"hidden\" name=\"" + s.extraData[n].name + "\">").val(s.extraData[n].value).appendTo(form)[0]
                else
                  extraInputs.push $("<input type=\"hidden\" name=\"" + n + "\">").val(s.extraData[n]).appendTo(form)[0]
          unless s.iframeTarget
            $io.appendTo "body"
            if io.attachEvent
              io.attachEvent "onload", cb
            else
              io.addEventListener "load", cb, false
          setTimeout checkState, 15
          form.submit()
        finally
          form.setAttribute "action", a
          if t
            form.setAttribute "target", t
          else
            $form.removeAttr "target"
          $(extraInputs).remove()
      cb = (e) ->
        return  if xhr.aborted or callbackProcessed
        try
          doc = getDoc(io)
        catch ex
          log "cannot access response document: ", ex
          e = SERVER_ABORT
        if e is CLIENT_TIMEOUT_ABORT and xhr
          xhr.abort "timeout"
          deferred.reject xhr, "timeout"
          return
        else if e is SERVER_ABORT and xhr
          xhr.abort "server abort"
          deferred.reject xhr, "error", "server abort"
          return
        return  unless timedOut  if not doc or doc.location.href is s.iframeSrc
        if io.detachEvent
          io.detachEvent "onload", cb
        else
          io.removeEventListener "load", cb, false
        status = "success"
        errMsg = undefined
        try
          throw "timeout"  if timedOut
          isXml = s.dataType is "xml" or doc.XMLDocument or $.isXMLDoc(doc)
          log "isXml=" + isXml
          if not isXml and window.opera and (doc.body is null or not doc.body.innerHTML)
            if --domCheckCount
              log "requeing onLoad callback, DOM not available"
              setTimeout cb, 250
              return
          docRoot = (if doc.body then doc.body else doc.documentElement)
          xhr.responseText = (if docRoot then docRoot.innerHTML else null)
          xhr.responseXML = (if doc.XMLDocument then doc.XMLDocument else doc)
          s.dataType = "xml"  if isXml
          xhr.getResponseHeader = (header) ->
            headers = "content-type": s.dataType
            headers[header]

          if docRoot
            xhr.status = Number(docRoot.getAttribute("status")) or xhr.status
            xhr.statusText = docRoot.getAttribute("statusText") or xhr.statusText
          dt = (s.dataType or "").toLowerCase()
          scr = /(json|script|text)/.test(dt)
          if scr or s.textarea
            ta = doc.getElementsByTagName("textarea")[0]
            if ta
              xhr.responseText = ta.value
              xhr.status = Number(ta.getAttribute("status")) or xhr.status
              xhr.statusText = ta.getAttribute("statusText") or xhr.statusText
            else if scr
              pre = doc.getElementsByTagName("pre")[0]
              b = doc.getElementsByTagName("body")[0]
              if pre
                xhr.responseText = (if pre.textContent then pre.textContent else pre.innerText)
              else xhr.responseText = (if b.textContent then b.textContent else b.innerText)  if b
          else xhr.responseXML = toXml(xhr.responseText)  if dt is "xml" and not xhr.responseXML and xhr.responseText
          try
            data = httpData(xhr, dt, s)
          catch e
            status = "parsererror"
            xhr.error = errMsg = (e or status)
        catch e
          log "error caught: ", e
          status = "error"
          xhr.error = errMsg = (e or status)
        if xhr.aborted
          log "upload aborted"
          status = null
        status = (if (xhr.status >= 200 and xhr.status < 300 or xhr.status is 304) then "success" else "error")  if xhr.status
        if status is "success"
          s.success.call s.context, data, "success", xhr  if s.success
          deferred.resolve xhr.responseText, "success", xhr
          $.event.trigger "ajaxSuccess", [xhr, s]  if g
        else if status
          errMsg = xhr.statusText  if errMsg is `undefined`
          s.error.call s.context, xhr, status, errMsg  if s.error
          deferred.reject xhr, "error", errMsg
          $.event.trigger "ajaxError", [xhr, s, errMsg]  if g
        $.event.trigger "ajaxComplete", [xhr, s]  if g
        $.event.trigger "ajaxStop"  if g and not --$.active
        s.complete.call s.context, xhr, status  if s.complete
        callbackProcessed = true
        clearTimeout timeoutHandle  if s.timeout
        setTimeout (->
          $io.remove()  unless s.iframeTarget
          xhr.responseXML = null
        ), 100
      form = $form[0]
      el = undefined
      i = undefined
      s = undefined
      g = undefined
      id = undefined
      $io = undefined
      io = undefined
      xhr = undefined
      sub = undefined
      n = undefined
      timedOut = undefined
      timeoutHandle = undefined
      useProp = !!$.fn.prop
      deferred = $.Deferred()
      if $("[name=submit],[id=submit]", form).length
        alert "Error: Form elements must not have name or id of \"submit\"."
        deferred.reject()
        return deferred
      if a
        i = 0
        while i < elements.length
          el = $(elements[i])
          if useProp
            el.prop "disabled", false
          else
            el.removeAttr "disabled"
          i++
      s = $.extend(true, {}, $.ajaxSettings, options)
      s.context = s.context or s
      id = "jqFormIO" + (new Date().getTime())
      if s.iframeTarget
        $io = $(s.iframeTarget)
        n = $io.attr("name")
        unless n
          $io.attr "name", id
        else
          id = n
      else
        $io = $("<iframe name=\"" + id + "\" src=\"" + s.iframeSrc + "\" />")
        $io.css
          position: "absolute"
          top: "-1000px"
          left: "-1000px"

      io = $io[0]
      xhr =
        aborted: 0
        responseText: null
        responseXML: null
        status: 0
        statusText: "n/a"
        getAllResponseHeaders: ->

        getResponseHeader: ->

        setRequestHeader: ->

        abort: (status) ->
          e = ((if status is "timeout" then "timeout" else "aborted"))
          log "aborting upload... " + e
          @aborted = 1
          try
            io.contentWindow.document.execCommand "Stop"  if io.contentWindow.document.execCommand
          $io.attr "src", s.iframeSrc
          xhr.error = e
          s.error.call s.context, xhr, e, status  if s.error
          $.event.trigger "ajaxError", [xhr, s, e]  if g
          s.complete.call s.context, xhr, e  if s.complete

      g = s.global
      $.event.trigger "ajaxStart"  if g and 0 is $.active++
      $.event.trigger "ajaxSend", [xhr, s]  if g
      if s.beforeSend and s.beforeSend.call(s.context, xhr, s) is false
        $.active--  if s.global
        deferred.reject()
        return deferred
      if xhr.aborted
        deferred.reject()
        return deferred
      sub = form.clk
      if sub
        n = sub.name
        if n and not sub.disabled
          s.extraData = s.extraData or {}
          s.extraData[n] = sub.value
          if sub.type is "image"
            s.extraData[n + ".x"] = form.clk_x
            s.extraData[n + ".y"] = form.clk_y
      CLIENT_TIMEOUT_ABORT = 1
      SERVER_ABORT = 2
      csrf_token = $("meta[name=csrf-token]").attr("content")
      csrf_param = $("meta[name=csrf-param]").attr("content")
      if csrf_param and csrf_token
        s.extraData = s.extraData or {}
        s.extraData[csrf_param] = csrf_token
      if s.forceSync
        doSubmit()
      else
        setTimeout doSubmit, 10
      data = undefined
      doc = undefined
      domCheckCount = 50
      callbackProcessed = undefined
      toXml = $.parseXML or (s, doc) ->
        if window.ActiveXObject
          doc = new ActiveXObject("Microsoft.XMLDOM")
          doc.async = "false"
          doc.loadXML s
        else
          doc = (new DOMParser()).parseFromString(s, "text/xml")
        (if (doc and doc.documentElement and doc.documentElement.nodeName isnt "parsererror") then doc else null)

      parseJSON = $.parseJSON or (s) ->
        window["eval"] "(" + s + ")"

      httpData = (xhr, type, s) ->
        ct = xhr.getResponseHeader("content-type") or ""
        xml = type is "xml" or not type and ct.indexOf("xml") >= 0
        data = (if xml then xhr.responseXML else xhr.responseText)
        $.error "parsererror"  if $.error  if xml and data.documentElement.nodeName is "parsererror"
        data = s.dataFilter(data, type)  if s and s.dataFilter
        if typeof data is "string"
          if type is "json" or not type and ct.indexOf("json") >= 0
            data = parseJSON(data)
          else $.globalEval data  if type is "script" or not type and ct.indexOf("javascript") >= 0
        data

      deferred
    unless @length
      log "ajaxSubmit: skipping submit process - no element selected"
      return this
    method = undefined
    action = undefined
    url = undefined
    $form = this
    options = success: options  if typeof options is "function"
    method = @attr("method")
    action = @attr("action")
    url = (if (typeof action is "string") then $.trim(action) else "")
    url = url or window.location.href or ""
    url = (url.match(/^([^#]+)/) or [])[1]  if url
    options = $.extend(true,
      url: url
      success: $.ajaxSettings.success
      type: method or "GET"
      iframeSrc: (if /^https/i.test(window.location.href or "") then "javascript:false" else "about:blank")
    , options)
    veto = {}
    @trigger "form-pre-serialize", [this, options, veto]
    if veto.veto
      log "ajaxSubmit: submit vetoed via form-pre-serialize trigger"
      return this
    if options.beforeSerialize and options.beforeSerialize(this, options) is false
      log "ajaxSubmit: submit aborted via beforeSerialize callback"
      return this
    traditional = options.traditional
    traditional = $.ajaxSettings.traditional  if traditional is `undefined`
    elements = []
    qx = undefined
    a = @formToArray(options.semantic, elements)
    if options.data
      options.extraData = options.data
      qx = $.param(options.data, traditional)
    if options.beforeSubmit and options.beforeSubmit(a, this, options) is false
      log "ajaxSubmit: submit aborted via beforeSubmit callback"
      return this
    @trigger "form-submit-validate", [a, this, options, veto]
    if veto.veto
      log "ajaxSubmit: submit vetoed via form-submit-validate trigger"
      return this
    q = $.param(a, traditional)
    q = ((if q then (q + "&" + qx) else qx))  if qx
    if options.type.toUpperCase() is "GET"
      options.url += ((if options.url.indexOf("?") >= 0 then "&" else "?")) + q
      options.data = null
    else
      options.data = q
    callbacks = []
    if options.resetForm
      callbacks.push ->
        $form.resetForm()

    if options.clearForm
      callbacks.push ->
        $form.clearForm options.includeHidden

    if not options.dataType and options.target
      oldSuccess = options.success or ->

      callbacks.push (data) ->
        fn = (if options.replaceTarget then "replaceWith" else "html")
        $(options.target)[fn](data).each oldSuccess, arguments_

    else callbacks.push options.success  if options.success
    options.success = (data, status, xhr) ->
      context = options.context or this
      i = undefined
      max = callbacks.length
      i = 0
      while i < max
        callbacks[i].apply context, [data, status, xhr or $form, $form]
        i++

    fileInputs = $("input[type=file]:enabled[value!=\"\"]", this)
    hasFileInputs = fileInputs.length > 0
    mp = "multipart/form-data"
    multipart = ($form.attr("enctype") is mp or $form.attr("encoding") is mp)
    fileAPI = feature.fileapi and feature.formdata
    log "fileAPI :" + fileAPI
    shouldUseFrame = (hasFileInputs or multipart) and not fileAPI
    jqxhr = undefined
    if options.iframe isnt false and (options.iframe or shouldUseFrame)
      if options.closeKeepAlive
        $.get options.closeKeepAlive, ->
          jqxhr = fileUploadIframe(a)

      else
        jqxhr = fileUploadIframe(a)
    else if (hasFileInputs or multipart) and fileAPI
      jqxhr = fileUploadXhr(a)
    else
      jqxhr = $.ajax(options)
    $form.removeData("jqxhr").data "jqxhr", jqxhr
    k = 0

    while k < elements.length
      elements[k] = null
      k++
    @trigger "form-submit-notify", [this, options]
    return this

  $.fn.ajaxForm = (options) ->
    options = options or {}
    options.delegation = options.delegation and $.isFunction($.fn.on)
    if not options.delegation and @length is 0
      o =
        s: @selector
        c: @context

      if not $.isReady and o.s
        log "DOM not ready, queuing ajaxForm"
        $ ->
          $(o.s, o.c).ajaxForm options

        return this
      log "terminating; zero elements found by selector" + ((if $.isReady then "" else " (DOM not ready)"))
      return this
    if options.delegation
      $(document).off("submit.form-plugin", @selector, doAjaxSubmit).off("click.form-plugin", @selector, captureSubmittingElement).on("submit.form-plugin", @selector, options, doAjaxSubmit).on "click.form-plugin", @selector, options, captureSubmittingElement
      return this
    @ajaxFormUnbind().bind("submit.form-plugin", options, doAjaxSubmit).bind "click.form-plugin", options, captureSubmittingElement

  
  # ajaxFormUnbind unbinds the event handlers that were bound by ajaxForm
  $.fn.ajaxFormUnbind = ->
    @unbind "submit.form-plugin click.form-plugin"

  
  ###
  formToArray() gathers form element data into an array of objects that can
  be passed to any of the following ajax functions: $.get, $.post, or load.
  Each object in the array has both a 'name' and 'value' property.  An example of
  an array for a simple login form might be:
  
  [ { name: 'username', value: 'jresig' }, { name: 'password', value: 'secret' } ]
  
  It is this array that is passed to pre-submit callback functions provided to the
  ajaxSubmit() and ajaxForm() methods.
  ###
  $.fn.formToArray = (semantic, elements) ->
    a = []
    return a  if @length is 0
    form = this[0]
    els = (if semantic then form.getElementsByTagName("*") else form.elements)
    return a  unless els
    i = undefined
    j = undefined
    n = undefined
    v = undefined
    el = undefined
    max = undefined
    jmax = undefined
    i = 0
    max = els.length

    while i < max
      el = els[i]
      n = el.name
      continue  unless n
      if semantic and form.clk and el.type is "image"
        
        # handle image inputs on the fly when semantic == true
        if not el.disabled and form.clk is el
          a.push
            name: n
            value: $(el).val()
            type: el.type

          a.push
            name: n + ".x"
            value: form.clk_x
          ,
            name: n + ".y"
            value: form.clk_y

        continue
      v = $.fieldValue(el, true)
      if v and v.constructor is Array
        elements.push el  if elements
        j = 0
        jmax = v.length

        while j < jmax
          a.push
            name: n
            value: v[j]

          j++
      else if feature.fileapi and el.type is "file" and not el.disabled
        elements.push el  if elements
        files = el.files
        if files.length
          j = 0
          while j < files.length
            a.push
              name: n
              value: files[j]
              type: el.type

            j++
        else
          
          # #180
          a.push
            name: n
            value: ""
            type: el.type

      else if v isnt null and typeof v isnt "undefined"
        elements.push el  if elements
        a.push
          name: n
          value: v
          type: el.type
          required: el.required

      i++
    if not semantic and form.clk
      
      # input type=='image' are not found in elements array! handle it here
      $input = $(form.clk)
      input = $input[0]
      n = input.name
      if n and not input.disabled and input.type is "image"
        a.push
          name: n
          value: $input.val()

        a.push
          name: n + ".x"
          value: form.clk_x
        ,
          name: n + ".y"
          value: form.clk_y

    a

  
  ###
  Serializes form data into a 'submittable' string. This method will return a string
  in the format: name1=value1&amp;name2=value2
  ###
  $.fn.formSerialize = (semantic) ->
    
    #hand off to jQuery.param for proper encoding
    $.param @formToArray(semantic)

  
  ###
  Serializes all field elements in the jQuery object into a query string.
  This method will return a string in the format: name1=value1&amp;name2=value2
  ###
  $.fn.fieldSerialize = (successful) ->
    a = []
    @each ->
      n = @name
      return  unless n
      v = $.fieldValue(this, successful)
      if v and v.constructor is Array
        i = 0
        max = v.length

        while i < max
          a.push
            name: n
            value: v[i]

          i++
      else if v isnt null and typeof v isnt "undefined"
        a.push
          name: @name
          value: v


    
    #hand off to jQuery.param for proper encoding
    $.param a

  
  ###
  Returns the value(s) of the element in the matched set.  For example, consider the following form:
  
  <form><fieldset>
  <input name="A" type="text" />
  <input name="A" type="text" />
  <input name="B" type="checkbox" value="B1" />
  <input name="B" type="checkbox" value="B2"/>
  <input name="C" type="radio" value="C1" />
  <input name="C" type="radio" value="C2" />
  </fieldset></form>
  
  var v = $('input[type=text]').fieldValue();
  // if no values are entered into the text inputs
  v == ['','']
  // if values entered into the text inputs are 'foo' and 'bar'
  v == ['foo','bar']
  
  var v = $('input[type=checkbox]').fieldValue();
  // if neither checkbox is checked
  v === undefined
  // if both checkboxes are checked
  v == ['B1', 'B2']
  
  var v = $('input[type=radio]').fieldValue();
  // if neither radio is checked
  v === undefined
  // if first radio is checked
  v == ['C1']
  
  The successful argument controls whether or not the field element must be 'successful'
  (per http://www.w3.org/TR/html4/interact/forms.html#successful-controls).
  The default value of the successful argument is true.  If this value is false the value(s)
  for each element is returned.
  
  Note: This method *always* returns an array.  If no valid value can be determined the
  array will be empty, otherwise it will contain one or more values.
  ###
  $.fn.fieldValue = (successful) ->
    val = []
    i = 0
    max = @length

    while i < max
      el = this[i]
      v = $.fieldValue(el, successful)
      continue  if v is null or typeof v is "undefined" or (v.constructor is Array and not v.length)
      if v.constructor is Array
        $.merge val, v
      else
        val.push v
      i++
    val

  
  ###
  Returns the value of the field element.
  ###
  $.fieldValue = (el, successful) ->
    n = el.name
    t = el.type
    tag = el.tagName.toLowerCase()
    successful = true  if successful is `undefined`
    return null  if successful and (not n or el.disabled or t is "reset" or t is "button" or (t is "checkbox" or t is "radio") and not el.checked or (t is "submit" or t is "image") and el.form and el.form.clk isnt el or tag is "select" and el.selectedIndex is -1)
    if tag is "select"
      index = el.selectedIndex
      return null  if index < 0
      a = []
      ops = el.options
      one = (t is "select-one")
      max = ((if one then index + 1 else ops.length))
      i = ((if one then index else 0))

      while i < max
        op = ops[i]
        if op.selected
          v = op.value
          # extra pain for IE...
          v = (if (op.attributes and op.attributes["value"] and not (op.attributes["value"].specified)) then op.text else op.value)  unless v
          return v  if one
          a.push v
        i++
      return a
    $(el).val()

  
  ###
  Clears the form data.  Takes the following actions on the form's input fields:
  - input text fields will have their 'value' property set to the empty string
  - select elements will have their 'selectedIndex' property set to -1
  - checkbox and radio inputs will have their 'checked' property set to false
  - inputs of type submit, button, reset, and hidden will *not* be effected
  - button elements will *not* be effected
  ###
  $.fn.clearForm = (includeHidden) ->
    @each ->
      $("input,select,textarea", this).clearFields includeHidden


  
  ###
  Clears the selected form elements.
  ###
  $.fn.clearFields = $.fn.clearInputs = (includeHidden) ->
    re = /^(?:color|date|datetime|email|month|number|password|range|search|tel|text|time|url|week)$/i # 'hidden' is not in this list
    @each ->
      t = @type
      tag = @tagName.toLowerCase()
      if re.test(t) or tag is "textarea"
        @value = ""
      else if t is "checkbox" or t is "radio"
        @checked = false
      else if tag is "select"
        @selectedIndex = -1
      else if t is "file"
        if $.browser.msie
          $(this).replaceWith $(this).clone()
        else
          $(this).val ""
      
      # includeHidden can be the value true, or it can be a selector string
      # indicating a special test; for example:
      #  $('#myForm').clearForm('.special:hidden')
      # the above would clean hidden inputs that have the class of 'special'
      else @value = ""  if (includeHidden is true and /hidden/.test(t)) or (typeof includeHidden is "string" and $(this).is(includeHidden))  if includeHidden


  
  ###
  Resets the form data.  Causes all form elements to be reset to their original value.
  ###
  $.fn.resetForm = ->
    @each ->
      
      # guard against an input with the name of 'reset'
      # note that IE reports the reset function as an 'object'
      @reset()  if typeof @reset is "function" or (typeof @reset is "object" and not @reset.nodeType)


  
  ###
  Enables or disables any matching elements.
  ###
  $.fn.enable = (b) ->
    b = true  if b is `undefined`
    @each ->
      @disabled = not b


  
  ###
  Checks/unchecks any matching checkboxes or radio buttons and
  selects/deselects and matching option elements.
  ###
  $.fn.selected = (select) ->
    select = true  if select is `undefined`
    @each ->
      t = @type
      if t is "checkbox" or t is "radio"
        @checked = select
      else if @tagName.toLowerCase() is "option"
        $sel = $(this).parent("select")
        
        # deselect all other options
        $sel.find("option").selected false  if select and $sel[0] and $sel[0].type is "select-one"
        @selected = select


  
  # expose debug var
  $.fn.ajaxSubmit.debug = false
) jQuery