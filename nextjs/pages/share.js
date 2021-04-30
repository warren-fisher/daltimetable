<Route path="/share/:id" children={
    <RenderTable
        width={this.state.size.width}
        height={this.state.size.height}
        getTermState={this.getTermState}
        handleChange={this.handleChange}
        terms={this.state.termsSelected} />
} />