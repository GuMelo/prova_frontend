<template>
  <div class="footer">
    <div class="footer-left">
      <p>© Copyright Crypto J. 2021 - Todos os direitos reservados ©</p>
    </div>
    <div class="footer-right">
      <p>Desenvolvido por <a class="link" href="https://github.com/gumelo" target="_blank">Gustavo Corrente</a></p>
    </div>
  </div>
</template>

<script>
export default {
  name: 'Footer'
}
</script>

<style>
  .footer {
    display: flex;
    flex-direction: row;
    justify-content: space-between;
    align-items: center;
    background: #244D68;
    padding: 0px 20px;
    height: 60px;
    z-index: 1;
  }

  .footer-left {
    display: flex;
    justify-content: flex-start;
    color: rgba(255,255,255,.75);
  }

  .footer-right {
    display: flex;
    justify-content: flex-end;
    color: rgba(255,255,255,.75);
  }
  .footer-left, .footer-right, p {
    margin-bottom: 0 !important;
    font-size: 14px !important;
  }

  .link {
    color: #ffffff !important;
    text-decoration: underline !important;
  }
</style>
