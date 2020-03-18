import { Injectable, Renderer2, RendererFactory2 } from '@angular/core';
import { Subject, Observable } from 'rxjs';

@Injectable()
export class KeyAccess {
  private renderer: Renderer2;
  removeTabKeyListener: Function;
  constructor(rendererFactory: RendererFactory2) {
    this.renderer = rendererFactory.createRenderer(null, null);
  }

  disableTab() {
    this.removeTabKeyListener = this.renderer.listen('document', 'keydown', (event) => {
      if (event.keyCode === 9) {
        event.preventDefault();
      }
    });
  }


  enableTab() {
    this.removeTabKeyListener();
    this.removeTabKeyListener = null;
  }
}
